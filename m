Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B819EB64D8
	for <ath11k@archiver.kernel.org>; Wed, 14 Jun 2023 04:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GS5v2xq0S/Q9fqHeKAY4h+vqYOt6j8oesz2amq2p61s=; b=25S3qDTSPX37Nc
	Zx1jCJ6LSDW/ndG+vSZsrBZgs5G2nd1vPr29s+LC9lJIUgHkUyNWsMlJjNa2fouX9xdYOmSh5MhXU
	nICzP9B+MUnmR/CkCy1l2guigLXFATie8CdT9k5MB2+XHgDea/QlE5y8X3Bv73snIHkJ6Pjj0WkTe
	DYmSox38ylm82gjz4EnWfDb8yhz05qicv9s/2WcEm0Y3AblAInOImFXyyhQnUpAgh9vz6O53N0qtl
	IIqOzZbsPTS4kkTkj3awsLN1xGcmwjjNciKTUF5B70MkWP8LfqKqPJOW4MGnjwdamLGDiOoYz3mOf
	Fi6RtsP9aK1ufy8a+6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9HkE-009uoI-1m;
	Wed, 14 Jun 2023 04:04:30 +0000
Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Hk7-009unC-2p
	for ath11k@lists.infradead.org;
	Wed, 14 Jun 2023 04:04:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686715463; x=1718251463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=j9v4z+xOJMN2xrp3cgHzKRWncbNpcvkzIojQLXSttgw=;
  b=O+ZYCARZIDwiFFsw2WgX5OxauIi9AK5hxYZr7AW2qgLlmgJ3FI1y5dpH
   GvmQ+OvEkroo89SH8sBx7P+D+nNb/yKhEJhsRENXMEzfTqfFgaeG7HfRS
   LmpxTOBEML6d0eb8S9etlG7BOsMvdX5whrISIsRtD+5al9Vrvjgqz3flC
   JGxSYEg/KzpvT/ivQd5cfkEgilD9jUzt/vbbHI+BU6VX76xbj1X6MEZ7T
   0FIgTsyWCI8lxyyB+LR25Tl8i5xhJdpXh811Hwo4tVS/ofaj9Gx+fBCFN
   SMJUvg4/I0CWVVEjpzn0EYuRH0oiEBAzW1OeyIclsXwAOZFH+zVdwr/Zz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="356007161"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="356007161"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 21:02:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="741680271"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="741680271"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 13 Jun 2023 21:02:28 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9HiF-0000A1-2B;
	Wed, 14 Jun 2023 04:02:27 +0000
Date: Wed, 14 Jun 2023 12:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: Arowa Suliman <arowa@chromium.org>, ath11k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Arowa Suliman <arowa@google.com>
Subject: Re: [PATCH] wifi: ath11k: Add crash logging
Message-ID: <202306141105.c1e82Q0y-lkp@intel.com>
References: <20230614023125.284218-1-arowa@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230614023125.284218-1-arowa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_210424_016966_DB38093A 
X-CRM114-Status: GOOD (  14.50  )
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

Hi Arowa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvalo-ath/ath-next]
[cannot apply to wireless/main wireless-next/main linus/master v6.4-rc6 next-20230613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arowa-Suliman/wifi-ath11k-Add-crash-logging/20230614-103201
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
patch link:    https://lore.kernel.org/r/20230614023125.284218-1-arowa%40google.com
patch subject: [PATCH] wifi: ath11k: Add crash logging
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230614/202306141105.c1e82Q0y-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add kvalo-ath https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git
        git fetch kvalo-ath ath-next
        git checkout kvalo-ath/ath-next
        b4 shazam https://lore.kernel.org/r/20230614023125.284218-1-arowa@google.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141105.c1e82Q0y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath11k/mhi.c: In function 'ath11k_mhi_op_status_cb':
>> drivers/net/wireless/ath/ath11k/mhi.c:328:25: warning: passing argument 2 of 'ath11k_info' makes pointer from integer without a cast [-Wint-conversion]
     328 |         ath11k_info(ab, ATH11K_DBG_BOOT, "notify status reason %s\n",
         |                         ^~~~~~~~~~~~~~~
         |                         |
         |                         int
   In file included from drivers/net/wireless/ath/ath11k/mhi.c:14:
   drivers/net/wireless/ath/ath11k/debug.h:76:69: note: expected 'const char *' but argument is of type 'int'
      76 | __printf(2, 3) void ath11k_info(struct ath11k_base *ab, const char *fmt, ...);
         |                                                         ~~~~~~~~~~~~^~~


vim +/ath11k_info +328 drivers/net/wireless/ath/ath11k/mhi.c

   322	
   323	static void ath11k_mhi_op_status_cb(struct mhi_controller *mhi_cntrl,
   324					    enum mhi_callback cb)
   325	{
   326		struct ath11k_base *ab = dev_get_drvdata(mhi_cntrl->cntrl_dev);
   327	
 > 328	        ath11k_info(ab, ATH11K_DBG_BOOT, "notify status reason %s\n",
   329			   ath11k_mhi_op_callback_to_str(cb));
   330	
   331		switch (cb) {
   332		case MHI_CB_SYS_ERROR:
   333			ath11k_warn(ab, "firmware crashed: MHI_CB_SYS_ERROR\n");
   334			break;
   335		case MHI_CB_EE_RDDM:
   336			ath11k_warn(ab, "firmware crashed: MHI_CB_EE_RDDM\n");
   337	                if (!(test_bit(ATH11K_FLAG_UNREGISTERING, &ab->dev_flags)))
   338				queue_work(ab->workqueue_aux, &ab->reset_work);
   339			break;
   340		default:
   341			break;
   342		}
   343	}
   344	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
