Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMif-0002fj-AB
 for ath11k@lists.infradead.org; Thu, 10 Dec 2020 14:14:58 +0000
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 82530C433CA
 for <ath11k@lists.infradead.org>; Thu, 10 Dec 2020 14:14:52 +0000 (UTC)
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 0/6] ath11k: QCA6390 stability fixes
References: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org>
Date: Thu, 10 Dec 2020 16:14:50 +0200
In-Reply-To: <1607609124-17250-1-git-send-email-kvalo@codeaurora.org> (Kalle
 Valo's message of "Thu, 10 Dec 2020 16:05:18 +0200")
Message-ID: <87r1nx4ujp.fsf@codeaurora.org>
MIME-Version: 1.0
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Few fixes to improve statibility on QCA6390. Please review.
>
> Kalle
>
> Carl Huang (4):
>   ath11k: put hw to DBS using WMI_PDEV_SET_HW_MODE_CMDID
>   ath11k: pci: fix hot reset stability issues
>   ath11k: pci: fix L1ss clock unstable problem
>   ath11k: pci: disable VDD4BLOW
>
> Kalle Valo (1):
>   ath11k: mhi: print a warning if firmware crashed
>
> Pradeep Kumar Chitrapu (1):
>   ath11k: Fix incorrect tlvs in scan start command

Forgot to mention that these fixes are just cleaned up versions from
ath11k-qca6390-bringup branch prepared to go to v5.11, so nothing new
here for QCA6390 testing point of view.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
