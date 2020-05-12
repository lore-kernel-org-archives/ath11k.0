Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYQF4-0000vG-AZ
 for ath11k@lists.infradead.org; Tue, 12 May 2020 08:26:26 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 21/24]
 drivers/net/wireless/ath/ath11k/pci.c:49:34: warning: Local variable
 'msi_config' shadows outer variable [shadowVariable]
References: <202005121153.gLRyf9Tw%lkp@intel.com>
Date: Tue, 12 May 2020 11:26:06 +0300
In-Reply-To: <202005121153.gLRyf9Tw%lkp@intel.com> (kbuild test robot's
 message of "Tue, 12 May 2020 11:11:56 +0800")
Message-ID: <87sgg536g1.fsf@kamboji.qca.qualcomm.com>
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
To: kbuild test robot <lkp@intel.com>
Cc: Govind Singh <govinds@codeaurora.org>, kbuild-all@lists.01.org, ath11k@lists.infradead.org, ath10k@lists.infradead.org

+ ath11k

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   6303acc5b03a5fc3bf6cf5fa072ae0dc9aaa5dd0
> commit: 398a800c183de17a49a5779550e72fbc3ba1e592 [21/24] ath11k: Add msi config init for QCA6390
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
>
> cppcheck warnings: (new ones prefixed by >>)
>
>>> drivers/net/wireless/ath/ath11k/pci.c:49:34: warning: Local variable 'msi_config' shadows outer variable [shadowVariable]
>     const struct ath11k_msi_config *msi_config;
>                                     ^
>    drivers/net/wireless/ath/ath11k/pci.c:23:39: note: Shadowed declaration
>    static const struct ath11k_msi_config msi_config = {
>                                          ^
>    drivers/net/wireless/ath/ath11k/pci.c:49:34: note: Shadow variable
>     const struct ath11k_msi_config *msi_config;

I fixed this in the pending branch by changing renaming the static
variable to ath11k_msi_config:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=76bce5bd3875bd3d8329a69057e2d63064d90b09

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
