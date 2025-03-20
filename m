Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FCBC28B30
	for <ath11k@archiver.kernel.org>; Thu, 20 Mar 2025 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HNOn1s3syUBP5uAd1lFQsx15I1O4vZEXPip5DLA2Ss=; b=mGWvV01bYkl7Wb3nC7hLd1MnBo
	1AYzHzkpnpQG88wqHK4p++Se0ZUgG1JbPZsX2Gg39+cEs8Vm0TkyG5hrr48kaw7PQ1fjbQBEWkQL1
	umuprsjJhsq6zwqmhUfS7mq6eRnvOK5GDzz9AtEZ9TxM9r4xT6GdXV7JZ3+4lWATHOSmXR02C4PEp
	2FKTgzidSX11r3h/D3udqzln9FmxD1OphPsRF6qtItatKSWWBTy8m6dcDqlufiFu24O7PYB+04BX1
	KoKjQ4iu86Vj7siE1NzHz4AlFY7eBvIEJgMsYSVxlUYX3MOz0KZ5+BA2EtWIibYQh5ESmY8pXBqv3
	Ji7fwReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcJ-0000000DPBr-3eBr;
	Thu, 20 Mar 2025 22:43:59 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvOcH-0000000DPBH-35P7
	for ath11k@lists.infradead.org;
	Thu, 20 Mar 2025 22:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742510638; x=1774046638;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=auxEEuY+xDpirUEPyxYSNf0pr+NS+Jjo/6xqZzmpriI=;
  b=NcsmhJUolzkoEPAOwUPHowmcneTYiJwlOWrXXe/jVgLnfDfyLZMNZ7x7
   oaYLhETVZvQMWrgJGhONyYct1LSDhdwMuHjYxr1ktfNDFbLGEvtmYTFr4
   +IQXXraI+uveGBVGpsITo51pxEyUjxKsZOdzytWWpZArZ/hZwkYO8l4/T
   1CFf1yavXTDag0SMUNv2wqdB1ud5jceIbdM/yo8CewEPh1zSC1JbNhZGP
   OoXXC0z4YsOjyT34vlpMw1vzkdlCAsdQZYBj+5Pqpf6NGBGNg8dAtj/+O
   Qurm40hFoa2m5bUOV4osoKXGntWlVWjm02MqlfKTrWFmHWJthuU+TR2zl
   A==;
X-CSE-ConnectionGUID: OFfUm5LuRHic2dDWy7OEAg==
X-CSE-MsgGUID: v5N8UAfEQZ+/k97i4JkwHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="47543830"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="47543830"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2025 15:43:57 -0700
X-CSE-ConnectionGUID: VJgZY0yFScicTmekw+cYPw==
X-CSE-MsgGUID: SVQIDu9UQeWEHUtds+YQZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; 
   d="scan'208";a="154124462"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Mar 2025 15:43:55 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvOc7-0000q7-1O;
	Thu, 20 Mar 2025 22:43:49 +0000
Date: Fri, 21 Mar 2025 06:43:31 +0800
From: kernel test robot <lkp@intel.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>, ath11k@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org, quic_bqiang@quicinc.com
Subject: Re: [PATCH ath-next 1/5] wifi: ath11k: determine PM policy based on
 machine model
Message-ID: <202503210624.I3zealnl-lkp@intel.com>
References: <20250320023003.65028-2-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320023003.65028-2-quic_bqiang@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_154357_810934_573BAD16 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Baochen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on b6f473c96421b8b451a8df8ccb620bcd71d4b3f4]

url:    https://github.com/intel-lab-lkp/linux/commits/Baochen-Qiang/wifi-ath11k-determine-PM-policy-based-on-machine-model/20250320-103536
base:   b6f473c96421b8b451a8df8ccb620bcd71d4b3f4
patch link:    https://lore.kernel.org/r/20250320023003.65028-2-quic_bqiang%40quicinc.com
patch subject: [PATCH ath-next 1/5] wifi: ath11k: determine PM policy based on machine model
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250321/202503210624.I3zealnl-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503210624.I3zealnl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503210624.I3zealnl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/core.c:2381:19: warning: cast to smaller integer type 'enum ath11k_pm_policy' from 'void *' [-Wvoid-pointer-to-enum-cast]
    2381 |                 ab->pm_policy = (enum ath11k_pm_policy)dmi_id->driver_data;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +2381 drivers/net/wireless/ath/ath11k/core.c

  2373	
  2374	int ath11k_core_init(struct ath11k_base *ab)
  2375	{
  2376		const struct dmi_system_id *dmi_id;
  2377		int ret;
  2378	
  2379		dmi_id = dmi_first_match(ath11k_pm_quirk_table);
  2380		if (dmi_id)
> 2381			ab->pm_policy = (enum ath11k_pm_policy)dmi_id->driver_data;
  2382		else
  2383			ab->pm_policy = ATH11K_PM_DEFAULT;
  2384	
  2385		ath11k_dbg(ab, ATH11K_DBG_BOOT, "pm policy %u\n", ab->pm_policy);
  2386	
  2387		ret = ath11k_core_soc_create(ab);
  2388		if (ret) {
  2389			ath11k_err(ab, "failed to create soc core: %d\n", ret);
  2390			return ret;
  2391		}
  2392	
  2393		return 0;
  2394	}
  2395	EXPORT_SYMBOL(ath11k_core_init);
  2396	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

