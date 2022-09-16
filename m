Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537E0ECAAD8
	for <ath11k@archiver.kernel.org>; Fri, 16 Sep 2022 19:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yj2EbhvN75hqKNexJBmn3DDOB9nG/nrWm3JHfm3wXD4=; b=Gyp0fvg75C+oU9
	FP21Z6n9keo3H5JvAksUBlLm70fN5vGc28EIJuIp7Y6M7fAo1VLXpBfVxJ7S5iq9nf8YkiECHi5O7
	jcDxOqEUF0R9J6SJ5aioiC5WafERWYxMFVgsFn9nlqzpq/QhRbSgxeDXRXSlORapBts/X4FN+fG2S
	dEnkN3f5WQNHmv95DXP2DTjMd0VPjG5nYiu27hICZH8LC7pz07aaqlU172SQLXzmu05GSsUdoeQsV
	Q97gzxm47tAq4mHzYC3KRbQ/4u4pGtnL3C+bhG4HM2WBbQ8h0MSk3VsYQpvIG03srmJ5ko6hz+gVP
	3cjKg62kYLDGJtjcENlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZHEu-00GNNB-38; Fri, 16 Sep 2022 19:43:04 +0000
Received: from mga12.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZHES-00GN5h-Bo
	for ath11k@lists.infradead.org; Fri, 16 Sep 2022 19:42:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663357356; x=1694893356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zt7Jubm60tCWy/mnWh0gWMiuVSSQkR9yoOZigwu8hCg=;
  b=FqrMdErF/mPDiToqF3PeVojxJRapdWfUZwa4GQYjQxUS4oN73qnxU4rF
   syxuZiK/CpFAdFYbd3TSXu6ZKGnkHyB9p8vhxQHIovbzvoYp+0vQT49To
   LLmRmOrMLv8yz+HpROHPfXeN7ghOJLKkkU4mpeaJgOklyvLubXlUsybbJ
   THFPIAhMLx23iFYFeaGPvNFU+FPLR/qdlYJOOguJTY5JWrw3V74Edm1hR
   51tkL45YOAstCjIGSvIXJBe1pR9rkAOADXN6J3zyAsPdboSrFHAzZcrrP
   4Zwk/A3o0TWl5Bxqg9krMkQCfLb0fVJynDeyEOJRT0pgHVdERIhKYatKW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="278794284"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="278794284"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2022 12:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; 
   d="scan'208";a="595363880"
Received: from lkp-server02.sh.intel.com (HELO 41300c7200ea) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 16 Sep 2022 12:42:20 -0700
Received: from kbuild by 41300c7200ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oZHEB-00026E-2B;
	Fri, 16 Sep 2022 19:42:19 +0000
Date: Sat, 17 Sep 2022 03:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jun Yu <junyuu@chromium.org>, ath11k@lists.infradead.org
Cc: kbuild-all@lists.01.org, linux-wireless@vger.kernel.org,
	Jun Yu <junyuu@chromium.org>
Subject: Re: [PATCH] wifi: ath11k: retrieve MAC address from system firmware
 if provided
Message-ID: <202209170307.720C1Sx4-lkp@intel.com>
References: <20220914215408.372520-1-junyuu@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220914215408.372520-1-junyuu@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_124236_581140_AE9BBFB3 
X-CRM114-Status: GOOD (  12.68  )
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
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20220917/202209170307.720C1Sx4-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/7a1539aed9ed31bd3b93c177abda0a2f4fea3945
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jun-Yu/wifi-ath11k-retrieve-MAC-address-from-system-firmware-if-provided/20220915-055714
        git checkout 7a1539aed9ed31bd3b93c177abda0a2f4fea3945
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/wireless/ath/ath11k/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath11k/mac.c: In function 'ath11k_mac_register':
>> drivers/net/wireless/ath/ath11k/mac.c:8999:9: error: too many arguments to function 'device_get_mac_address'
    8999 |         device_get_mac_address(ab->dev, mac_addr, sizeof(ab->mac_addr));
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/ieee80211.h:20,
                    from include/net/mac80211.h:20,
                    from drivers/net/wireless/ath/ath11k/mac.c:7:
   include/linux/etherdevice.h:35:5: note: declared here
      35 | int device_get_mac_address(struct device *dev, char *addr);
         |     ^~~~~~~~~~~~~~~~~~~~~~


vim +/device_get_mac_address +8999 drivers/net/wireless/ath/ath11k/mac.c

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
