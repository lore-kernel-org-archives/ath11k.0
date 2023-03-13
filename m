Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B7AC6FD19
	for <ath11k@archiver.kernel.org>; Mon, 13 Mar 2023 12:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aOVY9rLHw7c9aUJgUzKG+Q9Q5kno2ZzX+4f0PEMf07I=; b=D/9SocXV6tNsC9
	uLBoUdiI8k067xbqvldbkAqim23Cxr7O35G8cz6EFQByygpvUXAyRwUA4P+KbLyeNr6RMOhWfHNZI
	qag7OcvDtJSu8uyqYQc/aito9l20rtjKGJ2jeVc3Qd3QO6fDJa4/nkp8sluuwReNxgNbvJijEAxZk
	dNgDlTHZFTASNq5KARo9/b/kEet1UtE7P6gMzx+7e2xHB9uwHhoMFvBVGZNEMVE4itE/Dtvk6l/si
	Y1ipSvrUm4BD2m639CVIqQv5Fa6Lrr8ew5Mm5/ddsjT1t/byZxm+khD0AHUDFhIaREOxd0qLxxAo8
	yJ44hM2fBTmu5vgsDt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbhAz-005er6-Sa; Mon, 13 Mar 2023 12:21:17 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbhAx-005eq8-Ge
	for ath11k@lists.infradead.org; Mon, 13 Mar 2023 12:21:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4AB5ACE1047;
	Mon, 13 Mar 2023 12:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22855C433D2;
	Mon, 13 Mar 2023 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678710069;
	bh=JgDvYzN6YxVum9eHZ/d+wPLy0NmyaZFS6qgpGnpgco4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KJge0beXo2uL/yrcI8ua9XHPjDY1TJdyegpdrGH4RuBV8hPk2X3Meos5ulorbqQIm
	 5QNA9FdRJ1BH5utGkoANI1AHJ3QZlM2acsTK01xhvWkk/GeiYiadv2HXIVmFEukAOD
	 F6/xf5JotXimwtzVK4S/FzcTiF3QgsBc6q/iuxj5+0C0i3ivLAkfvUseaHYusqslGO
	 1EyhaquQfjs/kp6xGdaUzpi+qH3w+bmxodvF7CsEQpwcgTdc5P4ncoxq744bY1oGj6
	 zIeNfzQqlbzpt79MHNBxtUhTJRRlkuqFspfdYG6vu0eYD05SSt825Jf63ikQzwEOJE
	 fZFDXF9WjrI6w==
From: Kalle Valo <kvalo@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: <ath11k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/2] ath11k: factory test mode support
References: <20230213130854.2473-1-quic_rajkbhag@quicinc.com>
Date: Mon, 13 Mar 2023 14:21:07 +0200
In-Reply-To: <20230213130854.2473-1-quic_rajkbhag@quicinc.com> (Raj Kumar
	Bhagat's message of "Mon, 13 Feb 2023 18:38:52 +0530")
Message-ID: <87edpson9o.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_052115_739374_221D93BA 
X-CRM114-Status: GOOD (  13.02  )
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

Raj Kumar Bhagat <quic_rajkbhag@quicinc.com> writes:

> Device is booted in factory test mode to calibrate the board.
> The commands are sent from a userspace application, which is
> sent to firmware using wmi commands. Firmware will send the
> response back to the application which stores the calibration
> data in caldata.bin file. This file will be loaded when the
> device boots up normally next time.
>
> Govindaraj Saminathan (1):
>   wifi: ath11k: factory test mode support
>
> Sowmiya Sree Elavalagan (1):
>   wifi: ath11k: Allow ath11k to boot without caldata in ftm mode

While reviewing the patches I made quite a few style cleanup to patches
(too many to list):

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=4a5ca29c396ace5c46b208a8c15a3ba53eabaddd

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=master-pending&id=ba74c7478f5d15ce38e609b9ad4810db7511a3dd

I only compile tested them. Please use these as the baseline for v2.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
