Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVfIL-00065Y-H5
 for ath11k@lists.infradead.org; Thu, 22 Oct 2020 18:26:39 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PULL] ath10k & ath11k firmware 20201022
References: <BYAPR02MB4567892AD5957F360C01E73F921D0@BYAPR02MB4567.namprd02.prod.outlook.com>
Date: Thu, 22 Oct 2020 21:26:30 +0300
In-Reply-To: <BYAPR02MB4567892AD5957F360C01E73F921D0@BYAPR02MB4567.namprd02.prod.outlook.com>
 (Kalle Valo's message of "Thu, 22 Oct 2020 08:23:01 +0000")
Message-ID: <87sga65d7t.fsf@codeaurora.org>
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
To: "linux-firmware@kernel.org" <linux-firmware@kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Hi linux-firmware maintainers,
>
> here's a pull request for ath10k and ath11k drivers. For ath10k there
> is a firmware for new hardware QCA6174 hw3.0 SDIO. For ath11k there
> are firmwares for new hardware IPQ8074 hw2.0, IPQ6018 hw1.0 and
> QCA6390 hw2.0. And also few updates for existing hardware.
>
> I did not include QCA9377 SDIO firmware as I saw Christian submitted a
> patch adding that.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit 58d41d0facca2478d3e45f6321224361519aee96:
>
>   ice: Add comms package file for Intel E800 series driver (2020-10-05 08:09:03 -0400)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git ath10k-20201022

I noticed that ath11k Notice.txt files are not valid utf-8. Please drop
this pull request, I'll send a fixed one tomorrow.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
