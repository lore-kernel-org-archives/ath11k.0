Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31F1C77B71
	for <ath11k@archiver.kernel.org>; Fri, 14 Apr 2023 20:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhKTWfZQ3zR55Xhxt47yaiR7olSoU/rhHPlZg6GxFxM=; b=qekLVM6g7qVU/v
	fSZr9hopFywVki7rm/5GkYY/HH1LeqmrzB3ZLR9ad2Mcq/B1u941+7DNWAppAJi8UIci7SaYE39Ey
	Tdavfl/COy38LE9PIGacqU5FzH57OSXwT0DaHt6BIAqOMO4mzfd175aQna1782+hDWwQtDbq/xUD0
	T8iRczg6a2rU511/V9ZAnjJy0GE0TbOyCADPxsR/NomC42mNYErxWTK5SsGAYEQOJ7+LMfRwI4hzw
	qq0F5rBJL/ZmN6W+65tMJ64YTVF4d9j3eZZJOw3UhH71sVaAmfaE+8qrxenaUL9WPLOmNVre0QE4R
	kEEaCc8TErRiiPN5VTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnQUb-00AYWV-3C;
	Fri, 14 Apr 2023 20:58:01 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnQUX-00AYVe-2A
	for ath11k@lists.infradead.org;
	Fri, 14 Apr 2023 20:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681505877; x=1713041877;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KV7yPUBZJ1mvdV8xkySfZ3z3xLKeVI9ZzUC+s0qeFV4=;
  b=IatbYe6Xk/zuv1Pbhf0r8Zoe6bVVjz78qGA5p2NQcBX2gb63bMx8LM6L
   +hRR8b8ErzQ9ULdmSqwcQAw/oDSY3uUnwNNDSL9CM8Fbj/1zlA4iZxnVF
   bl3hACFepBI0H7jmnZy1t4vtUI6hKsb2NIy1hawERArxCO96dvGVG5PIj
   s3fFt+MMghvO2HIzHhj6k55vB/C+zcIDyvXHywNZRMtuOcoiG7Ata3BiU
   Ix91nwNEagzTJo0C+PGOlWio9R3Wg96E7LsRR3+9nCiAZ0kFSwNJo28Uj
   ODgZIB3tkqMLn/ADNSqop5+5xRPoN+GVSEdCg77Jwxm9PnhFpGpAl2evo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="324917336"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="324917336"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 13:57:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="754583157"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; 
   d="scan'208";a="754583157"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 14 Apr 2023 13:57:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnQUP-000Zxo-13;
	Fri, 14 Apr 2023 20:57:49 +0000
Date: Sat, 15 Apr 2023 04:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	ath11k@lists.infradead.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
	Abinaya Kalaiselvan <quic_akalaise@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath11k: Add rx histogram stats
Message-ID: <202304150445.MrUZP5M4-lkp@intel.com>
References: <20230414112603.601199-1-quic_mkenna@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230414112603.601199-1-quic_mkenna@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_135757_746986_D593FFFF 
X-CRM114-Status: GOOD (  11.54  )
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
[cannot apply to wireless/main wireless-next/main linus/master v6.3-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maharaja-Kennadyrajan/wifi-ath11k-Add-rx-histogram-stats/20230414-192912
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
patch link:    https://lore.kernel.org/r/20230414112603.601199-1-quic_mkenna%40quicinc.com
patch subject: [PATCH v2] wifi: ath11k: Add rx histogram stats
config: hexagon-randconfig-r041-20230410 (https://download.01.org/0day-ci/archive/20230415/202304150445.MrUZP5M4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/8612657f6ce3fd8bd47a5c1b4ca0177e95a647f0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maharaja-Kennadyrajan/wifi-ath11k-Add-rx-histogram-stats/20230414-192912
        git checkout 8612657f6ce3fd8bd47a5c1b4ca0177e95a647f0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/wireless/ath/ath11k/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304150445.MrUZP5M4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath11k/debugfs_sta.c:8:
   In file included from drivers/net/wireless/ath/ath11k/debugfs_sta.h:9:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/net/wireless/ath/ath11k/debugfs_sta.c:8:
   In file included from drivers/net/wireless/ath/ath11k/debugfs_sta.h:9:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/net/wireless/ath/ath11k/debugfs_sta.c:8:
   In file included from drivers/net/wireless/ath/ath11k/debugfs_sta.h:9:
   In file included from include/net/mac80211.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/net/wireless/ath/ath11k/debugfs_sta.c:242:13: warning: no previous prototype for function 'legacy_rate_str' [-Wmissing-prototypes]
   const char *legacy_rate_str(int legacy_rate_idx)
               ^
   drivers/net/wireless/ath/ath11k/debugfs_sta.c:242:7: note: declare 'static' if the function is not intended to be used outside of this translation unit
   const char *legacy_rate_str(int legacy_rate_idx)
         ^
   static 
   7 warnings generated.


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
