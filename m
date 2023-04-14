Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC8BC77B72
	for <ath11k@archiver.kernel.org>; Fri, 14 Apr 2023 13:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JceSKmsMnD5jd29i+07r2zZ1joRT9FgIX6zOl08zEks=; b=lik/vRTC9RNAqO
	fan7aaiL2QBRt0y1kOWAp6nBvRDmwzO+jcFNvFXuSyVCTBRZlqXBf/9DOu26YzXRnt2YeM8cYdS6T
	4PkkNe2Ur5p9VckWyoDjITzQeyNg4XoF0m+9h2jH5MTsao5/7/Xwa5fK4ZuxanYU4bnQ2Lw6JkGVi
	9szqroXitnkTCLkS57chyEITK4/AScdA3/qkDTbUnDq6ohR89OMi6UNDPoEBRobKHSL9b/Uuoy2Xp
	ub7VIFjV9gF0YXgSC54KfWh8ABkZQMQWDUm51kkaCwwdLLpROroJhISI4F2BvOhi+vPcBHnweYwMe
	2YCQsEFU63tkpb49pJQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnJOu-009fL1-19;
	Fri, 14 Apr 2023 13:23:40 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnJOp-009fJe-2w
	for ath11k@lists.infradead.org;
	Fri, 14 Apr 2023 13:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681478615; x=1713014615;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JAZW5ATCnn7F5zZI8Jg4WMsIQ7Qb6hYI5RMM1N9r7sI=;
  b=kael9+sdSUXl5BfSxBPJFqM3vpHhO6pPCxPWHVl5Kka2fdAYvcSatNeF
   VyON3joVL7aShkwIWiHAhBFtTqJcLnzxn3fTwwzm7I7fPdRHxneSQb5Em
   n0EVvOMDYBlyxHNAi24UbJ4jJXN2hLS3vF+5G++P9a3+aBPJMf+8mmocU
   Jlqtm0QzOtNGduYaFZFvgWpSo5LDLXn3LMZFWlWcH6udnxQF0bBHCNkGd
   5EPZEJp7y7Dr9cgN3FttHfsmhRU2ncCUk1Niuo5KOHm5Uyv8+YmmALpQE
   sItOJEdcZJvJyIwOtx3n4nd0EebnNlAFGk1XWL+uI47Aw1bXg/RXKcEl+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="341959234"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="341959234"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 06:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="936009109"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="936009109"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2023 06:23:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnJOk-000ZYl-0W;
	Fri, 14 Apr 2023 13:23:30 +0000
Date: Fri, 14 Apr 2023 21:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	ath11k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Abinaya Kalaiselvan <quic_akalaise@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath11k: Add rx histogram stats
Message-ID: <202304142106.PaDYMwe0-lkp@intel.com>
References: <20230414112603.601199-1-quic_mkenna@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230414112603.601199-1-quic_mkenna@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_062335_978933_DF34AD16 
X-CRM114-Status: GOOD (  11.40  )
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

Hi Maharaja,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvalo-ath/ath-next]
[cannot apply to wireless/main wireless-next/main linus/master v6.3-rc6 next-20230413]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maharaja-Kennadyrajan/wifi-ath11k-Add-rx-histogram-stats/20230414-192912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
patch link:    https://lore.kernel.org/r/20230414112603.601199-1-quic_mkenna%40quicinc.com
patch subject: [PATCH v2] wifi: ath11k: Add rx histogram stats
config: ia64-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304142106.PaDYMwe0-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8612657f6ce3fd8bd47a5c1b4ca0177e95a647f0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maharaja-Kennadyrajan/wifi-ath11k-Add-rx-histogram-stats/20230414-192912
        git checkout 8612657f6ce3fd8bd47a5c1b4ca0177e95a647f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304142106.PaDYMwe0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/debugfs_sta.c:242:13: warning: no previous prototype for 'legacy_rate_str' [-Wmissing-prototypes]
     242 | const char *legacy_rate_str(int legacy_rate_idx)
         |             ^~~~~~~~~~~~~~~


vim +/legacy_rate_str +242 drivers/net/wireless/ath/ath11k/debugfs_sta.c

   241	
 > 242	const char *legacy_rate_str(int legacy_rate_idx)
   243	{
   244		switch (legacy_rate_idx) {
   245		case 0:
   246			return "1Mbps";
   247		case 1:
   248			return "2Mbps";
   249		case 2:
   250			return "5.5Mbps";
   251		case 3:
   252			return "6Mbps";
   253		case 4:
   254			return "9Mbps";
   255		case 5:
   256			return "11Mbps";
   257		case 6:
   258			return "12Mbps";
   259		case 7:
   260			return "18Mbps";
   261		case 8:
   262			return "18Mbps";
   263		case 9:
   264			return "24Mbps";
   265		case 10:
   266			return "36Mbps";
   267		case 11:
   268			return "48Mbps";
   269		case 12:
   270			return "54Mbps";
   271		default:
   272			return "invalid legacy rate index";
   273		}
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
