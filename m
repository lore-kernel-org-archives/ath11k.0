Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5943C6FD1D
	for <ath11k@archiver.kernel.org>; Tue, 21 Mar 2023 01:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6opa6xqps5sxWMRunGtkSB7Q63OKjQn2goMaY0n7ENU=; b=eVSNqM/jjFG1xm
	WbZCaZ+IDaSlY5S8mXvSwQQt5hHDF3E26DAQKS1mDt4KMtOFi35qy1/M74t8+O1zimfKbJ3cOwSlg
	X4jK+awDR1EGq/42av+Tq7F6VVMNwonQXAkEvXMs7ntmz3LVgzWJNCfposdgFKY7r6O94H0OZ8VUW
	hzjDV5XS+vHAAd8E9u+hIx9pyPEBK90saZrJ5rAGneTuMvgvZo64hDLhrRtd32855PkwvFRRGQ3TN
	y6xlLzegPwA+fSO3xWo2MhcUXodBWE1zPGRTTXN/X+ae2rFXD567WpJwADWk6wVJOYVFypWU4yKxd
	XutX8NQbjPrgw/c+aFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peRFs-00AyYi-1i;
	Tue, 21 Mar 2023 01:57:40 +0000
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peRFp-00AyY4-2r
	for ath11k@lists.infradead.org;
	Tue, 21 Mar 2023 01:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679363857; x=1710899857;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HCV+Jpzz/Fd9dCFOhk5Hovmo50YPsn4eR/cUdi+ZVtE=;
  b=gLnRi9MUZ0S1Go116qxU4emgA4JDq3f+NxCUswcOb/SEnqyehgtZdDyY
   ZRo9XcKBVcEfpSYwn601nludjJMphKylVHUXLWE8VmGhyLMtUFsIUj3OZ
   au+Ot9RCn8EliUOQQrHHA/owo3zsr81ivHsljPi/yyRDtocZ6COsi07bT
   fosB3i552Zc4cUi/Vf1UbV9reKudCKOwRygVWQjoJ7DshlRGTDf/Vd8Pm
   oXMCXVt132U8oqC1Jx3aBi6QtEp91JXRzrF1Njlv3Q66RLZx00fy6rc8+
   c1Bmw8OBmGbBt6uPJAUvbJB+e+JPEeLkFDEYFEN3d+0c4e9X+t7FbTzUZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="401398801"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="401398801"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2023 18:57:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="927209009"
X-IronPort-AV: E=Sophos;i="5.98,277,1673942400"; 
   d="scan'208";a="927209009"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Mar 2023 18:57:11 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peRFK-000BUC-0e;
	Tue, 21 Mar 2023 01:57:06 +0000
Date: Tue, 21 Mar 2023 09:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	ath11k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
Subject: Re: [PATCH v2 4/4] wifi: ath11k: add AP power save support
Message-ID: <202303210910.Ag8f94jv-lkp@intel.com>
References: <20230320164334.3325886-5-quic_mkenna@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320164334.3325886-5-quic_mkenna@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_185737_999988_57A55A91 
X-CRM114-Status: GOOD (  11.73  )
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

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wireless-next/main]
[also build test WARNING on kvalo-ath/ath-next next-20230320]
[cannot apply to wireless/main linus/master v6.3-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maharaja-Kennadyrajan/wifi-nl80211-rename-NL80211_CMD_SET_BEACON-to-NL80211_CMD_UDPATE_AP/20230321-005501
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230320164334.3325886-5-quic_mkenna%40quicinc.com
patch subject: [PATCH v2 4/4] wifi: ath11k: add AP power save support
config: i386-randconfig-a005 (https://download.01.org/0day-ci/archive/20230321/202303210910.Ag8f94jv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel-lab-lkp/linux/commit/289c49facf48da5a221a3c8072f97c4641eca9f0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maharaja-Kennadyrajan/wifi-nl80211-rename-NL80211_CMD_SET_BEACON-to-NL80211_CMD_UDPATE_AP/20230321-005501
        git checkout 289c49facf48da5a221a3c8072f97c4641eca9f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/net/wireless/ath/ath11k/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303210910.Ag8f94jv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/mac.c:3218:6: warning: no previous prototype for 'ath11k_mac_ap_ps_recalc' [-Wmissing-prototypes]
    3218 | void ath11k_mac_ap_ps_recalc(struct ath11k *ar)
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/ath11k_mac_ap_ps_recalc +3218 drivers/net/wireless/ath/ath11k/mac.c

  3217	
> 3218	void ath11k_mac_ap_ps_recalc(struct ath11k *ar)
  3219	{
  3220		struct ath11k_vif *arvif;
  3221		enum ath11k_ap_ps_state state = ATH11K_AP_PS_STATE_OFF;
  3222		int ret;
  3223		bool allow_ap_ps = true;
  3224	
  3225		lockdep_assert_held(&ar->conf_mutex);
  3226	
  3227		list_for_each_entry(arvif, &ar->arvifs, list) {
  3228			if (arvif->vdev_type == WMI_VDEV_TYPE_STA ||
  3229			    !arvif->vif_ap_ps_enabled) {
  3230				allow_ap_ps = false;
  3231				break;
  3232			}
  3233		}
  3234	
  3235		if (!allow_ap_ps)
  3236			ath11k_dbg(ar->ab, ATH11K_DBG_MAC, "ap ps is not allowed\n");
  3237	
  3238		if (allow_ap_ps && !ar->num_stations && ar->ap_ps_enabled)
  3239			state = ATH11K_AP_PS_STATE_ON;
  3240	
  3241		if (ar->ap_ps_state == state)
  3242			return;
  3243	
  3244		ret = ath11k_wmi_pdev_ap_ps_cmd_send(ar, ar->pdev->pdev_id, state);
  3245		if (ret) {
  3246			ath11k_dbg(ar->ab, ATH11K_DBG_MAC,
  3247				   "failed to send ap ps command pdev_id %u state %u\n",
  3248				   ar->pdev->pdev_id, state);
  3249			return;
  3250		}
  3251	
  3252		ar->ap_ps_state = state;
  3253	}
  3254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
