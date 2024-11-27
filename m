Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A747D6ACC4
	for <ath11k@archiver.kernel.org>; Wed, 27 Nov 2024 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpewDsh7yobJLaWUslG8bxbswQX0jqbSuiTLLXCbYJ0=; b=T/9g5pIsv5zjue1cY7b7RuCOh5
	5UjfdXZMzUxKBT50NQgp/n9qRMbcBQyfkC70MS0uT5z45YDxaJFqL/9udsfBdjf5v++4vovTn5xqJ
	UykfX5BVBzHyD+ldY1nheld/xBZZMYAj50R9TbijEN8OR83rDNFR2eldseT+7OUhSbuPuTKgTmzdQ
	vBkM1x8U7R/qj5BRdfFfOGGjoDYF/gCYPHHIRImApWWuGMN83Ay9EwhkcXeFtqlyKL15YCwgaBrCG
	6xW+hfFY84hu8MWEYFMCVBJ6J4R4pdTfxoYPknI/F3WEFIUsGmdCA1rg++Gi+isBga6X0BQ/PgCBD
	ZN4FSbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHL6-0000000DA7I-01CR;
	Wed, 27 Nov 2024 12:40:16 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGHL3-0000000DA6P-0SWg
	for ath11k@lists.infradead.org;
	Wed, 27 Nov 2024 12:40:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1732711210; x=1733316010; i=markus.elfring@web.de;
	bh=fpewDsh7yobJLaWUslG8bxbswQX0jqbSuiTLLXCbYJ0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pvlo/KHCSbLP8cZbzImcZt0xMgqjXXMFztLLmb7enGMNdG5xogqvlgXv0ugpvSNT
	 V3VfN3ewFyrZk2YkbUPk8SGwYZLRSrVNXcokA6Hl3VlFNHQf5/rTgm/FzplurL8BE
	 3boBkyOMsO0dcVPrJ3AUt0jzaKB54DxmNS8yb1vM0h3Ql/QqjnYK3L/5ev2t0B6IT
	 Cc9IrJij9GqOEqflBTqt8aGDNA3XQIpx4kyy74uqF2ReGKopknyio9Liz5Gtgpqml
	 7VRX/YVMbXDkBcaIYge/1v30mOqyEQlVxylxuID5FSrh6T9n2UNGc1WMIkiYIIt0A
	 hybLSef0oBNdGXootQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MECCd-1tNjyu4A4b-00HFGe; Wed, 27
 Nov 2024 13:40:10 +0100
Message-ID: <30b208e0-55a2-400f-9638-1765e7ed3bfa@web.de>
Date: Wed, 27 Nov 2024 13:40:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath11k: Fix NULL pointer check in ath11k_ce_rx_post_pipe()
To: Baichuan Qi <zghbqbc@gmail.com>, ath11k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Johnson <jjohnson@kernel.org>
References: <a9ccc947-20b2-4322-84e5-c96aaa604e63@web.de>
 <20241127032821.57468-1-hbczqbc@163.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241127032821.57468-1-hbczqbc@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LVu/Ji+o6eubGrNMXXAgVq6F/AKt6uw/930Y/eLxbGkhzSwJz2h
 JOI7w0JPyoOko/iZWnHSZRdPWHMadzEN4zpkaXwa1reapplPQy/mJZzRcekJr0bRmbZaFPf
 msoHLzwRvSrs0acCW1XcxoZYhJyXhjOXSv0vQ9kU02Nc1K+IhfofvSOwSrdvzyX0yyxhZdf
 ph65CwuL3yx60NXHhZESA==
UI-OutboundReport: notjunk:1;M01:P0:bDKwGBQ2AXM=;zVmvMiej+8akaBmIA8831siJ9+x
 aaFLK+PPR7o/TiWKddMyOtjZKVDVTjDVmjI/VxRbZOeNQqo9QqXRRscKrZuFpiWlzzEIFbztW
 XpfbrbI7IgIWX+61fTJ1MFXeFqp2zPnUTgzRASWM5c2u9QsNpNifHyln7POukBy/esu2d7ty/
 4ASvuSdd1/WRjndLyv/zjh6qY3aH4UV+2hr/r9o5y1CTrORFwSLZJPTlPAMSndd1+hlcr6AmB
 H535oHz2PzLSQX8/NspKQLlmRB/E/bX1LK10/SQYfiGgeHc3xwWvZDIjOeS7WdrOi7U3YOB8K
 7F26tI3USkiDHEcMDOgZweSyzIMMiyZHU0kL9a7AbAzVI+0c5IOW/wRf6TCzQhqSTYMx9Y3P6
 yv2cVSLT6PyLboJaSK3LqdZRDjf1T33W3Y35V5PEQPMCAoScZ3Z8e2c1KMKCfH6RX51kOk3d+
 u/jmYpFf8lIfIvLE3SqQ9wz0w3nffT5FGde5k6W8Vu/ehigo3XBn4WNYyyfUlMQA9tvxJDpFJ
 QCfOWf8o0Xe1HFuTbiha8oXKxsvPZFcaoHYdsV3N1D4T4+AmpRDzestAYL4FPs9ieCNQYr07X
 lQblkvyouOAAfAPJNfk2NJ4J9rm4wYJ7ckNmOUJFG1U4n6cGzLqwg4ev0EvE1WzCEuJFF8gHB
 XBWvpWgj7g8jz0zrDmJfZ7/hDvGvoCT0yNV/jUO1NVE9Y7zOBXseZKKPoHerLidAUVnuqBfFU
 f88fexrf11GqaMRWoUwbyLps2JOWUs49UUFp2DwkR1FJJGNgnYB0DM7/xJi0wbTVgHwGuNEsJ
 BwgiW9T3cEXktoAn51h0PXYlxl0O8NpR0RZ3ptXu37W/Lx2tkQbKr7VWDcr45pc2IDfuXPqoq
 TAZpqTuBB3Wy2nnEgKCD8wkqK6aVrDSAi82lS6IofATol1ZqpDH4YGN812K5iRlf8SPfvdMzl
 v9AcaWqy8VK+3PihbTpPFRs1YchxA0ZtiPd0DZltmTimqg50orU79NYq9Bs1i+bGwKIlGa/Nw
 b+FiN/e6Lk1KTWpF+mcA71s0TH2Gis0IKScsXWwuTw4pQ58Qi3crnz60OGHTa9XcEwrEqYf7Z
 2AkOWDu54=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_044013_439924_F33896ED 
X-CRM114-Status: UNSURE (   6.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

>> Is there a need to reconsider also such a return value?
>
> According to the current code (commit d5c65159f289) of
> this function, this function should be terminated directly
> after checking the null pointer, the return value may be
> meaningless.
The return value is checked at two source code places at least.

* ath11k_ce_recv_process_cb():
  https://elixir.bootlin.com/linux/v6.12.1/source/drivers/net/wireless/ath=
/ath11k/ce.c#L450

* ath11k_ce_rx_post_buf():
  https://elixir.bootlin.com/linux/v6.12.1/source/drivers/net/wireless/ath=
/ath11k/ce.c#L893


May the detection of a null pointer for the data structure members
=E2=80=9Cdest_ring=E2=80=9D or =E2=80=9Cstatus_ring=E2=80=9D really be int=
erpreted as a successful execution
of the function =E2=80=9Cath11k_ce_rx_post_pipe=E2=80=9D?

Regards,
Markus

