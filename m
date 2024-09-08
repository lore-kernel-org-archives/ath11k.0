Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3213BCD4F4C
	for <ath11k@archiver.kernel.org>; Sun,  8 Sep 2024 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kBS0uMS51fqOSg289Upex9nDOrhbYN43LRBR5RsYQU=; b=YYI03iETpFgK2oEUYoHZf9hAS4
	0arceUsOxHDNKZl58QubwG2VHyViECj/vxV0+TdubPfz3/mkV9dTcHcktynhWoTQW4MdZ3TUUy0js
	DXk19BfDS5wOueEZHbyIXmkyR9h2kyhf5/fDEJRE0O9WZv8Tzp/90FvNVCJWZP5ebrkxIHjTEKOUU
	/wqk+uL1dAmUEt4B1nSFTD6wEv/Jh4uZVQJrbEJOZKSdk3Uve70sd2iEx52smYou90cOMwMHFit8r
	+akAOFoMrm42oQho7IEpqIaVg5jWeB3ufb6ly0zKIWMj1+nXV6h7uVzW8KDP8KZLncqQ74emxreYC
	jl3IyQdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snFeh-0000000Gdm2-13Ja;
	Sun, 08 Sep 2024 11:00:31 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snFee-0000000Gdlf-0mmF
	for ath11k@lists.infradead.org;
	Sun, 08 Sep 2024 11:00:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C10DDA400FB
	for <ath11k@lists.infradead.org>; Sun,  8 Sep 2024 11:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28BFCC4CEC3;
	Sun,  8 Sep 2024 11:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725793226;
	bh=0kBS0uMS51fqOSg289Upex9nDOrhbYN43LRBR5RsYQU=;
	h=Date:From:To:Cc:Subject:From;
	b=rqfkXhuJ+yUTilcMyHbD7X2hGph2Cmcfe9e5AQXmbvu0gRxB0CldTz/gqHOajlRYA
	 SZyn1UP3yqqlXwZ46KssrOrRkxhaoM5raBwCLZTo9pKFluTciI/tw2HUDBvX9bChX/
	 uzeoQMnIREIMYg07VfdECFLZbeBQqtl3PvyEOnyyQu6WHmp3YhI3a5ys+wPNORW6Ox
	 4/JvhxawqMVz/xQazPok2FemBaswZmVzNGARuoYPIaUVK1XYRm7/aTaCRXDyyVuWOH
	 zP9mPSHUe7E7S5Gq1VZORdlqrki/2bLic1E0vip8adF+cALCeZoozEtoy8YpRB+9OQ
	 /1SVnVp0cf1aQ==
Date: Sun, 8 Sep 2024 13:00:23 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: ath11k@lists.infradead.org
Cc: Kalle Valo <kvalo@kernel.org>
Subject: board.bin file for IPQ9574
Message-ID: <t4kb7ljvau3ycvfr66kkidjqy2iim5ln2jobzrv5x6glb5cfwi@ybjrfbrogxwg>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_040028_314908_22E9A152 
X-CRM114-Status: UNSURE (   6.63  )
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

Hi Kalle and linux-wireless,

I am trying to bring up a IPQ9574 prototype board with QCN5124 chip.

I am stuck with the ath11k driver requesting board.bin file, which I
seem to be unable to find anywhere. There is such a file (board-2.bin)
for example for the IPQ8074 SoC in linux-firmware [1].

There is IPQ9574 folder in https://github.com/quic/upstream-wifi-fw but
it does not contain no board.bin, only other files that kernel
requested.

What is happening? Why isn't this file available anywhere?

Thanks.

Marek

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/ath11k/IPQ8074/hw2.0

