Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7254FECAAD3
	for <ath11k@archiver.kernel.org>; Sat, 17 Sep 2022 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jKGnWent6BuRNpXbex1jBmsbf79OlIIMpasL/4wlxvQ=; b=XaLzvoolJoP2JC
	ZX4YPBlbGcSz0MVudw4S8yJLw/eb/qo/DsfJR2G75zpKWMJApHQFfXGsqPeCCFpCYst5oxp+EDrKg
	L49yF/xCE/vtRl1hXAYKjQUQSHa/2q+XOJKISj21ZeBtkPm/U7/dBfKppGe/5qgmRmhpc/MZ1ht8I
	IHSlfadqJzIykAWOfztnNRPc1lSnAkTKOvEZa+hxWQnkMmFr74U4QMR4jPFiQAXAVzfzFbH+wvwYL
	85KzJfME2GVKaZMXen8zRaovnQcDI3c8vHUiXdeSHKKwNUT4N4JDloqUPE1IqMYv1K2MD+hyClCdZ
	sgBx40/dDTwxv4uPP2pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZZ93-006bZB-7H; Sat, 17 Sep 2022 14:50:13 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZZ90-006bWM-CN
	for ath11k@lists.infradead.org; Sat, 17 Sep 2022 14:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663426210; x=1694962210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cr1wgj8QaEilsSF87VZTrjUdwycUY+q/4Sn13bLXrf4=;
  b=mQ12rTDNBDmY99UIz+s9D08ZilVoYKC2QczvF1CUfB6GLoo0BIGBdpUY
   P4usWCK6NaZxLMCO3dasIHQgHh+y3KN4lEym7fKO1GkT0JZNp/v+4AQBz
   KK9m2ejgFoT0Y1vere//XzZXeP9guXprRovHUCmwJ8PEI/ibZ+ve+RU2f
   OyAJMVjQ1rLhojLaVeQVWlx7zeor3atXsqcJESH0uXxXfH7fP0k/y9Pwc
   vNKKGlXcei/02vshpYY6R6uJDjTFJJeEuuTElBSIpasjDrQNjnoHRavtW
   jJfwX+z5UYn6jmLBDMO9AfQD+Ky5RvP42fqRq8qccimR10G7ANAqLt3sl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10473"; a="297886621"
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="297886621"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2022 07:50:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,323,1654585200"; 
   d="scan'208";a="569144060"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Sep 2022 07:50:00 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZZ8p-0000PX-1f;
	Sat, 17 Sep 2022 14:49:59 +0000
Date: Sat, 17 Sep 2022 22:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jun Yu <junyuu@chromium.org>, ath11k@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-wireless@vger.kernel.org, Jun Yu <junyuu@chromium.org>
Subject: Re: [PATCH] wifi: ath11k: retrieve MAC address from system firmware
 if provided
Message-ID: <202209172236.KWe4R2Dm-lkp@intel.com>
References: <20220914215408.372520-1-junyuu@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220914215408.372520-1-junyuu@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220917_075010_494394_1993D515 
X-CRM114-Status: GOOD (  13.09  )
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

Hi Jun,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kvalo-ath/ath-next]
[also build test ERROR on wireless/main wireless-next/main linus/master v6.0-rc5 next-20220916]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jun-Yu/wifi-ath11k-retrieve-MAC-address-from-system-firmware-if-provided/20220915-055714
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220917/202209172236.KWe4R2Dm-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/7a1539aed9ed31bd3b93c177abda0a2f4fea3945
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jun-Yu/wifi-ath11k-retrieve-MAC-address-from-system-firmware-if-provided/20220915-055714
        git checkout 7a1539aed9ed31bd3b93c177abda0a2f4fea3945
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/mac.c:8999:44: error: too many arguments to function call, expected 2, have 3
           device_get_mac_address(ab->dev, mac_addr, sizeof(ab->mac_addr));
           ~~~~~~~~~~~~~~~~~~~~~~                    ^~~~~~~~~~~~~~~~~~~~
   include/linux/etherdevice.h:35:5: note: 'device_get_mac_address' declared here
   int device_get_mac_address(struct device *dev, char *addr);
       ^
   1 error generated.


vim +8999 drivers/net/wireless/ath/ath11k/mac.c

  8979	
  8980	int ath11k_mac_register(struct ath11k_base *ab)
  8981	{
  8982		struct ath11k *ar;
  8983		struct ath11k_pdev *pdev;
  8984		int i;
  8985		int ret;
  8986		u8 mac_addr[ETH_ALEN] = {0};
  8987	
  8988		if (test_bit(ATH11K_FLAG_REGISTERED, &ab->dev_flags))
  8989			return 0;
  8990	
  8991		/* Initialize channel counters frequency value in hertz */
  8992		ab->cc_freq_hz = IPQ8074_CC_FREQ_HERTZ;
  8993		ab->free_vdev_map = (1LL << (ab->num_radios * TARGET_NUM_VDEVS(ab))) - 1;
  8994	
  8995		ret = ath11k_peer_rhash_tbl_init(ab);
  8996		if (ret)
  8997			return ret;
  8998	
> 8999		device_get_mac_address(ab->dev, mac_addr, sizeof(ab->mac_addr));
  9000	
  9001		for (i = 0; i < ab->num_radios; i++) {
  9002			pdev = &ab->pdevs[i];
  9003			ar = pdev->ar;
  9004			if (ab->pdevs_macaddr_valid) {
  9005				ether_addr_copy(ar->mac_addr, pdev->mac_addr);
  9006			} else {
  9007				if (is_zero_ether_addr(mac_addr))
  9008					ether_addr_copy(ar->mac_addr, ab->mac_addr);
  9009				else
  9010					ether_addr_copy(ar->mac_addr, mac_addr);
  9011				ar->mac_addr[4] += i;
  9012			}
  9013	
  9014			idr_init(&ar->txmgmt_idr);
  9015			spin_lock_init(&ar->txmgmt_idr_lock);
  9016	
  9017			ret = __ath11k_mac_register(ar);
  9018			if (ret)
  9019				goto err_cleanup;
  9020	
  9021			init_waitqueue_head(&ar->txmgmt_empty_waitq);
  9022		}
  9023	
  9024		return 0;
  9025	
  9026	err_cleanup:
  9027		for (i = i - 1; i >= 0; i--) {
  9028			pdev = &ab->pdevs[i];
  9029			ar = pdev->ar;
  9030			__ath11k_mac_unregister(ar);
  9031		}
  9032	
  9033		ath11k_peer_rhash_tbl_destroy(ab);
  9034	
  9035		return ret;
  9036	}
  9037	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
