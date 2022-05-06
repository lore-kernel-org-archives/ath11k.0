Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AFFC433EF
	for <ath11k@archiver.kernel.org>; Fri,  6 May 2022 08:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/oqHPbkm5MyJSLVizT9vY6PN/bGcHbHswXIW3E+1KX8=; b=b3dxuHy8lyqvfJ
	YWdgfPF/UEwd5YakdzHuPErR4g1VIhOJvpBKXRyM/qSb1fFRHMn81sE5ITNPz47kToZqkDBgGbqFL
	/S525hbkmRxYn3tKpugD4oc+AsD8i2GPjsclt5BROg1t0omwa9EQPZhm33si7TbkfNc0L3gKG6Pku
	vVSOAhgWrmP/0zkysJ6e6T2zoDJoSsIB/1T+ldO8E5UPgCm+UYBPSvWq/EDtell3W5aybMGNXgD9K
	xtL4Nh7P5/u7h3GxnwfZ5s0cE9gX90IgUn0Rfx5lgArkvEpzn5yxdnddAFv+p43IfJoxHlH8dJ49/
	izj0YkgMu/XSoV8FB8Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmtIP-0024no-0l; Fri, 06 May 2022 08:26:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmtCh-0022QK-Ik
 for ath11k@lists.infradead.org; Fri, 06 May 2022 08:20:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E3A6B61FD7;
 Fri,  6 May 2022 08:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE2AC385AA;
 Fri,  6 May 2022 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651825246;
 bh=2ddK1yVHAyUYor4XQsjfjUkKRJCYd8Itd63+QmS3LCc=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=TYH6Y+0lxazXyDO/Nl9fbBvc5x/CPxgRd07rOdzTVDId0Fer/v6ADUcubfAKPw+Yz
 gZ56MndvVuPwuvwD7YsKGYR2THNtT+9JXPocQsU+tfl8r/w+muRHeAUZfXIHtWpUdh
 3bXE8m8yRHqck/Y8zh0CZ43Wkk+ovpCpPxEzQwzGBSUNSE7PDXrGY+44mD6tq4vEij
 ze4MlK0Es6yicJdoOnttRG6sCVQUSQcMRAJMuh9/wRitZF5+tKnvj3Io1a+YHu8qET
 9yJGtXj+R3JZNJJOB9sm4OBKKZ6C19qfMsQ3Bgl17VsO6qVtQEyQ3tuNIcKDS+zCkM
 AW9dZ1nrcBgnQ==
From: Kalle Valo <kvalo@kernel.org>
To: Wim Van Boven <wimvanboven@gmail.com>
Cc: ath11k <ath11k@lists.infradead.org>
Subject: Re: support for WCN6855 liteon subsystem device 11ad:a82d
References: <6VYEBR.N4O0Q6H2MTME3@gmail.com> <87bkwb9ndg.fsf@kernel.org>
Date: Fri, 06 May 2022 11:20:43 +0300
In-Reply-To: <87bkwb9ndg.fsf@kernel.org> (Kalle Valo's message of "Fri, 06 May
 2022 09:38:35 +0300")
Message-ID: <877d6z9in8.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_012047_713166_B7125D26 
X-CRM114-Status: GOOD (  16.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Kalle Valo <kvalo@kernel.org> writes:

> Wim Van Boven <wimvanboven@gmail.com> writes:
>
>> the firmware doesn't have the board information for this
>> subsystem-device:
>>
>> 02:00.0 Network controller [0280]: Qualcomm Atheros QCNFA765
>> [17cb:1103] (rev 01)
>> Subsystem: Lite-On Communications Inc Device [11ad:a82d]
>>
>> however, it seems to work fine with this one:
>> bus=pci,vendor=17cb,device=1103,subsystem-vendor=14cd,subsystem-device=9409,qmi-chip-id=18,qmi-board-id=255m
>>
>> i hexedited the board-2.bin and swapped out the vendor and device
>> identifiers to match the LiteOn ones, which seems to work properly,
>> but is likely not the proper way to do this.
>
> BTW we have a tool for creating board-2.bin so that you don't need to
> use hexedit:
>
> https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath11k/ath11k-bdencoder
>
> Unfortunately no documentation but hopefully --help provides some guidance.
>
>> what would be the proper way to get support for this device and how
>> can i help?
>
> Can you report this to bugzilla.kernel.org:
>
> https://wireless.wiki.kernel.org/en/users/drivers/ath11k/bugreport
>
> That way it's easier to track. I'll try to find a board file for this
> device.

I see that you filed it now, thanks.

https://bugzilla.kernel.org/show_bug.cgi?id=215946

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
