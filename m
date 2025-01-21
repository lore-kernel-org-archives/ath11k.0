Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503ABC02182
	for <ath11k@archiver.kernel.org>; Tue, 21 Jan 2025 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hXM2a2eS/x9t4Qg7uHryYXc+55ZCWlomya/9VHVijM=; b=zHbkLETkd+Vi6n2tsVLOMb5zVV
	EIdGcZ0i4awg6Q/vAz8w9gISeLphVsjN5BNB/Ux8VHt3LEKlUTgN1nexYPeC+d/TXBTIqp3QU6ine
	fdiBJwMLbQcVwu0h0pDofiGs5KbbYctEO7cXpnl127scfSQRyMTdaLfF9ZjzWwcuRvv1q+LySApPw
	qB4b4+CbZh6kGhvVn+QsEjK71DJT9Kn4UbzSBi1j3dxLz2Vo/HAs/iIgdd8lv3QexFM2OfQWwcdzB
	GTDS3bGd5r2keasPNKAEkxxbJOHK6tAVnLrxMUxwvQKucDkxl2G5OW3VPIjqa9Sj+NYZIgzCq7GHa
	A2A8Tz5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taCUy-00000007lFi-2fos;
	Tue, 21 Jan 2025 11:32:48 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taCUv-00000007lD8-0XQu
	for ath11k@lists.infradead.org;
	Tue, 21 Jan 2025 11:32:47 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id A0A4E1F98F;
	Tue, 21 Jan 2025 12:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1737459158;
	bh=2hXM2a2eS/x9t4Qg7uHryYXc+55ZCWlomya/9VHVijM=; h=From:To:Subject;
	b=oWnH7oGLvOCk/Kt9hS6wX4Ws1DENW4sBdAr/N1lQwxdBcx4ma5uedwptZf4abQQIc
	 BIXSr2zauZJmiOLvodY0YblUAdSA8O8fHT+DzZDlYz7WVMGK6BiXLIWoRSirFamF+B
	 Tfj0PxlPKoJOT4gJC2aoCcmkL85XXo/ZY8IpQKThaL9Vc2v3MonIJN8AqU3KtKB0yw
	 r6rszksU6ugx3PjKIA+35vgnDNSSmfFOAagUp/0OPk/hg9ni8mBEMSV7C/XA8pNIWg
	 XAhppPf11dauJcAzfa+P8g4SCDDnQYcH3H/MPTrsA9lo6vVOBHq3WvPuVicmu8YQWi
	 2X0bArnd3d2mA==
Date: Tue, 21 Jan 2025 12:32:34 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
	Kalle Valo <kvalo@qca.qualcomm.com>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: ath11k-firmware: WCN6855 hw2.1: add Silex SX-PCEAX specific BDF
Message-ID: <20250121113234.GA28230@francesco-nb>
References: <Z1bc_jn-k-88Io3f@gaggiata.pivistrello.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1bc_jn-k-88Io3f@gaggiata.pivistrello.it>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_033246_050814_3E27B67E 
X-CRM114-Status: UNSURE (   7.89  )
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

+Jeff, that seems to be active on this area.

Hello all,

On Mon, Dec 09, 2024 at 01:05:18PM +0100, Francesco Dolcini wrote:
> I'd like to ask for inclusion for the board file for Silex SX-PCEAX
> radio module [1].

Any comment on this? It's been a while since I sent this and I had no
feedback so far.

Francesco


