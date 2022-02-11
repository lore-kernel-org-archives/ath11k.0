Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED41C433FE
	for <ath11k@archiver.kernel.org>; Fri, 11 Feb 2022 18:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHr8d0jXC5TUg38/r5KCkdRWWVu4glFj5jGFTT52h88=; b=QPj/WooiUuTi5l
	qC/SdhrhjtsDHnVdTGgjdGEH5z45/CT22l6k7y4v/FPHS8WtvHhAUnMOkTPrALwjg1Lcv7jyQDI6X
	Oo1umtZl5wv/oe2UjYQ727yoHoFwAi2450bSeR9p4FTaC3xJbsn50w8cw6jX9nwssHHgEoi+RYyC6
	8MP8R1igphBn8XwLqp6CDhEav+E/gz5mrR+xfFnY7aMIyXdNcfAit8WINTaUG1aLNQjYcWqgg8zqZ
	mVLdi/CYyzRVKHJIer9Ri4xiTBPhPdVy59WhhEAtWwcCEr+fH9bvS/XlkESQLs/1Hp6K+YSoz+rI/
	+24Z8PR37LEmuMN7mR4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIahI-008SKn-By; Fri, 11 Feb 2022 18:31:08 +0000
Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIahF-008SKR-A0
 for ath11k@lists.infradead.org; Fri, 11 Feb 2022 18:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644604265; x=1676140265;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rQyxWsPv1BNMrPsxnp08a5RWi5luBTZOV6PLZkuqVL8=;
 b=cD+UkHUr1PX9gnh5cDbrmhiTtjTIheY/ylBJX/+QYYUHU18tFnl/JSwd
 00wYbRICJdi6KM1QdsD+2h9BAurXbTKUI/Jl76fpVyHrR0grAXzSMM+UE
 qHmFqT4Ukdj37M0Lq/IsUFXmUujk+GLCn4P7Q+/KJACzMea+4+LtDz3O4
 LSl1SaK65D+Img+hlHql3DqAJVKWcL1+Keepn90Z7gv/pSAFOTaM6rOV/
 riFpb4Bk8b05TVg/hUODXjwS+U5G/1QcHsRz6a8SCnKofwQ469LJqjxX0
 wS5l6x4waOuWwUrNlykAgMbLwMVe6gBa2wGkyWldMNEPXdM9gA2g6AOqM Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="249731888"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="249731888"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 10:31:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; d="scan'208";a="569114788"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 11 Feb 2022 10:31:03 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nIahC-0004zY-K7; Fri, 11 Feb 2022 18:31:02 +0000
Date: Sat, 12 Feb 2022 02:30:16 +0800
From: kernel test robot <lkp@intel.com>
To: Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
 ath11k@lists.infradead.org
Cc: kbuild-all@lists.01.org, linux-wireless@vger.kernel.org,
 Venkateswara Naralasetty <quic_vnaralas@quicinc.com>
Subject: Re: [PATCH 2/6] ath11k: CFR module initialization and
 deinitialization for IPQ8074
Message-ID: <202202120243.5HtnZNDg-lkp@intel.com>
References: <1644592075-27082-3-git-send-email-quic_vnaralas@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1644592075-27082-3-git-send-email-quic_vnaralas@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220211_103105_433328_3E716649 
X-CRM114-Status: GOOD (  13.67  )
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

Hi Venkateswara,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on kvalo-ath/ath-next]
[cannot apply to wireless-next/main wireless/main jberg-mac80211-next/master jberg-mac80211/master v5.17-rc3 next-20220211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Venkateswara-Naralasetty/ath11k-add-single-shot-periodic-CFR-capture-support-for-IPQ8074/20220211-230911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20220212/202202120243.5HtnZNDg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d2559d5e11b6761fa81c7b6a5dcd1f506f72ef96
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Venkateswara-Naralasetty/ath11k-add-single-shot-periodic-CFR-capture-support-for-IPQ8074/20220211-230911
        git checkout d2559d5e11b6761fa81c7b6a5dcd1f506f72ef96
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross O=build_dir ARCH=alpha SHELL=/bin/bash drivers/net/wireless/ath/ath11k/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath11k/cfr.c:29:6: warning: no previous prototype for 'ath11k_cfr_ring_free' [-Wmissing-prototypes]
      29 | void ath11k_cfr_ring_free(struct ath11k *ar)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/ath11k_cfr_ring_free +29 drivers/net/wireless/ath/ath11k/cfr.c

    28	
  > 29	void ath11k_cfr_ring_free(struct ath11k *ar)
    30	{
    31		struct ath11k_cfr *cfr = &ar->cfr;
    32	
    33		ath11k_dbring_buf_cleanup(ar, &cfr->rx_ring);
    34		ath11k_dbring_srng_cleanup(ar, &cfr->rx_ring);
    35	}
    36	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
