Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1882C433F5
	for <ath11k@archiver.kernel.org>; Thu, 24 Feb 2022 16:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fx0z8sw95xodX0LLwW61LEQKzY+D+AlzfdRwRzOAdc0=; b=uELFfdQjN5waln
	txlKwgqTBIRLroP15/zGcNrcu/SaluRPhYf8duZexCX7ek8ahPtJGgxrXA35fAsVOzUsLzlQb60mZ
	piGL92LldbvqmZeROTasizI+OYvyjoFEMA7nhQY0d/ODx4aeTuZFLVZUfvNtI4oBWAHrKinWvnVSY
	I539isf5dKzZGeJGAX94dQUkYtjl4g7EgXldpGT82HpN+VELTROMQVtX/XPAshgc54xRctZDlgGnT
	J+4CSsQZwJepr5QVPERGQL8YHoBij4SmpqZ5ftV8yx60UjrmucOHroWBn+vNgD8VUXaZGL/6vbn/b
	PlDX3d/D5AKVWuvYEMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNGf3-001TPs-Cq; Thu, 24 Feb 2022 16:08:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNGeO-001T7i-R5; Thu, 24 Feb 2022 16:07:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C1F661784;
 Thu, 24 Feb 2022 16:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA22CC340E9;
 Thu, 24 Feb 2022 16:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645718847;
 bh=Z3+x1SIV9VOetp2p+0THAAyY/l8As1yQ1l0nOvyh4Z8=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=HTqylMlxNFaTe6EnEmYyjQUVi05GaviKofzAWOsskUtS0bDU6vhKnG1YPX4gV58d8
 6tsqZgEDoSELSkQVlI2XCjDJgjbJcSjg9En8hYEDwp1+pgxYWbta+cchr0+DYENBH3
 zKIUetZPB5kQ/j4CdBHCuZH4wOtU0MAlEDmFd7vwQ6dlrPIqOQBHipsHoExCFOgYi5
 vE/9zMEsUJuE4oyI/hC6aDuZ0oh/OSOf6cGTJtkRZEsUiwV8fAPUG2GOaxuAXVmVgf
 QPhUR9qheftZxEE09uINE/qvbLjg9hHpEblFzDwG2nPzwG7ZmX/OBCG1BBfEnapMQd
 NeyMVRLLfXKeQ==
From: Kalle Valo <kvalo@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Carl Huang <quic_cjhuang@quicinc.com>, kbuild-all@lists.01.org,
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
 Baochen Qiang <quic_bqiang@quicinc.com>, Wen Gong <quic_wgong@quicinc.com>,
 ath11k@lists.infradead.org
Subject: Re: [kvalo-ath:pending 37/42]
 drivers/net/wireless/ath/ath11k/wow.c:467:5: error: redefinition of
 'ath11k_wow_init'
References: <202202230812.uOGgSw5k-lkp@intel.com>
Date: Thu, 24 Feb 2022 18:07:21 +0200
In-Reply-To: <202202230812.uOGgSw5k-lkp@intel.com> (kernel test robot's
 message of "Wed, 23 Feb 2022 08:52:44 +0800")
Message-ID: <87zgmgtfie.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_080729_020279_0D3A06CC 
X-CRM114-Status: GOOD (  15.42  )
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

+ ath11k

kernel test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   4136ddcfda28450e2d01173e37300b95c8687d9b
> commit: cae84a492cacd9b4eecaafd5dab33f5beba8806e [37/42] ath11k: Add basic WoW functionalities
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20220223/202202230812.uOGgSw5k-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?id=cae84a492cacd9b4eecaafd5dab33f5beba8806e
>         git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
>         git fetch --no-tags kvalo-ath pending
>         git checkout cae84a492cacd9b4eecaafd5dab33f5beba8806e
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=m68k SHELL=/bin/bash
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/ath11k/wow.c:357:5: warning: no previous prototype for 'ath11k_wow_op_suspend' [-Wmissing-prototypes]
>      357 | int ath11k_wow_op_suspend(struct ieee80211_hw *hw,
>          |     ^~~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/wow.c:416:6: warning: no previous
> prototype for 'ath11k_wow_op_set_wakeup' [-Wmissing-prototypes]
>      416 | void ath11k_wow_op_set_wakeup(struct ieee80211_hw *hw, bool enabled)
>          |      ^~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/wow.c:425:5: warning: no previous
> prototype for 'ath11k_wow_op_resume' [-Wmissing-prototypes]
>      425 | int ath11k_wow_op_resume(struct ieee80211_hw *hw)
>          |     ^~~~~~~~~~~~~~~~~~~~
>>> drivers/net/wireless/ath/ath11k/wow.c:467:5: error: redefinition of
>>> 'ath11k_wow_init'
>      467 | int ath11k_wow_init(struct ath11k *ar)
>          |     ^~~~~~~~~~~~~~~
>    In file included from drivers/net/wireless/ath/ath11k/core.h:26,
>                     from drivers/net/wireless/ath/ath11k/wow.c:11:
>    drivers/net/wireless/ath/ath11k/wow.h:40:19: note: previous definition of 'ath11k_wow_init' with type 'int(struct ath11k *)'
>       40 | static inline int ath11k_wow_init(struct ath11k *ar)
>          |                   ^~~~~~~~~~~~~~~
>    drivers/net/wireless/ath/ath11k/wow.c: In function 'ath11k_wow_init':
>>> drivers/net/wireless/ath/ath11k/wow.c:482:22: error: 'struct wiphy'
>>> has no member named 'wowlan'
>      482 |         ar->hw->wiphy->wowlan = &ar->wow.wowlan_support;
>          |                      ^~

I was able to reproduce the errors by disabling CONFIG_PM. I fixed them
and pushed the new patch to the pending branch:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=624c999c214f02004c2f996aa6ce3a17dfbebd18

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
