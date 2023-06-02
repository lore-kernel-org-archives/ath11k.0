Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D662C7EE2C
	for <ath11k@archiver.kernel.org>; Fri,  2 Jun 2023 11:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zkmsN6ggF/j2C2YGbJujLmzttzsNjhZWz/kGMCC8Eo=; b=M80t3qWas/Zm1j
	9G9BCCrULrUYIbvif//xLyyydQtJxBkq4aFYcjLnG5hsZv3PjRuyjRe4CbGNfZtv+Y7ksYpCOMEmA
	+5f/ybY9vOXm8x9RLFsSWaqtLsxMwwZFiaNcD4WZo/8LV6EWXoQzs4dWd1XBPfIv7Dy4b/H92iChN
	JsKhOhJIXB6aTRsd2W1PGo9ABXVroAg+BKIK5hERSduydXjuKevpsDdJ8FM1cG83DO+OTapceHM+J
	8fgAk7KWBFSaFI5Fr+GhiaCMZcLcc968OAi+zJMV98t8YwkCMVjFsex6D4Iph/182f/YRFwm1fXlh
	8RFgoymoqDYz54exoe0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q52pg-006l0e-1Y;
	Fri, 02 Jun 2023 11:20:36 +0000
Received: from mga01.intel.com ([192.55.52.88])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q52pd-006kzI-39
	for ath11k@lists.infradead.org;
	Fri, 02 Jun 2023 11:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685704833; x=1717240833;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ibySYrNNT3IVJib73vqU6Prg/GfysDkIt45VKN1+9iI=;
  b=l/IpKuaTSIFtEhe5jYzicbkBSsUiJDRB0PpccU+7My9GeG2z2t26QLPc
   KcWeBhXpv77rEPRKs8/2kuU2cPNhHLEENtM2CjNY5CDSCOtcqusobwL0A
   W49S/xLiEMPi5D2K+POavvKhFQBBHjzVW7l4+d3ATln9S+eItYo2IjSbE
   XDB9LBMQ+UNB2qpRqi6XZNq9fU6bD3O+LBy511Lx049goW0Urr6VV+jBm
   4sA+OV6VbnmoY0XotzTMNF8WHcqbwmvL93V26qNp/KrSCeyRL/QwgIBzG
   lAWQ2TPY+a8FAOEPCOJsZQa2y84eq1Av5EnWb8JLgVrlr0xkxUmP4Ol6b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="384127856"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="384127856"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:20:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="685288774"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="685288774"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 02 Jun 2023 04:20:26 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q52pV-0000Nl-2C;
	Fri, 02 Jun 2023 11:20:25 +0000
Date: Fri, 2 Jun 2023 19:19:35 +0800
From: kernel test robot <lkp@intel.com>
To: Hari Chandrakanthan <quic_haric@quicinc.com>, quic_kvalo@quicinc.com,
	ath11k@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, linux-wireless@vger.kernel.org,
	Hari Chandrakanthan <quic_haric@quicinc.com>
Subject: Re: [PATCH] wifi: ath11k: add tx delay to TSF
Message-ID: <202306021958.bdB3k531-lkp@intel.com>
References: <1685698250-722-1-git-send-email-quic_haric@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1685698250-722-1-git-send-email-quic_haric@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_042034_028682_D0A59EB4 
X-CRM114-Status: GOOD (  12.65  )
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

Hi Hari,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvalo-ath/ath-next]
[also build test WARNING on next-20230602]
[cannot apply to linus/master v6.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hari-Chandrakanthan/wifi-ath11k-add-tx-delay-to-TSF/20230602-173351
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
patch link:    https://lore.kernel.org/r/1685698250-722-1-git-send-email-quic_haric%40quicinc.com
patch subject: [PATCH] wifi: ath11k: add tx delay to TSF
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230602/202306021958.bdB3k531-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/493e1ad70fff68a5c06b59683ebd453dafcafd19
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Hari-Chandrakanthan/wifi-ath11k-add-tx-delay-to-TSF/20230602-173351
        git checkout 493e1ad70fff68a5c06b59683ebd453dafcafd19
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021958.bdB3k531-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/wmi.c:8609:6: warning: no previous prototype for 'ath11k_wmi_event_tbttoffset_update' [-Wmissing-prototypes]
    8609 | void ath11k_wmi_event_tbttoffset_update(struct ath11k_base *ab, struct sk_buff *skb)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/ath11k_wmi_event_tbttoffset_update +8609 drivers/net/wireless/ath/ath11k/wmi.c

  8608	
> 8609	void ath11k_wmi_event_tbttoffset_update(struct ath11k_base *ab, struct sk_buff *skb)
  8610	{
  8611		struct wmi_tbtt_offset_info tbtt_offset_info;
  8612		int ret;
  8613	
  8614		ret = ath11k_wmi_tlv_iter(ab, skb->data, skb->len,
  8615					  ath11k_wmi_tbtt_offset_event_parser,
  8616					  &tbtt_offset_info);
  8617		if (ret) {
  8618			ath11k_warn(ab, "failed to parse tbtt tlv %d\n", ret);
  8619		}
  8620	}
  8621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
