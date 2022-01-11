Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B55BC433F5
	for <ath11k@archiver.kernel.org>; Tue, 11 Jan 2022 12:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=03ebdocvXPR6Oc9dWes4ZBcJHCk5mvrZjCtm47D6NPo=; b=Ui5pKnsY/RZlUm
	LEOPS26bciQfaSpVM8MiDQ+kkZvV6eqKQDjiQxjpQiNVCSzktLK3ljqK4CKDkiu0NGTxuMMh4OWk/
	pKH8JCQmSIPCx+Zqe4wIwF/Uu9iKsrcfPsnuZJbuesZhoMxJ9eCKlEvUV5BzGh5u6AtxdISKQzHz2
	r6QMI5XMrbetITxGcfEV0+oovrkKf1PupaRKd5uTIJ9ES1hPsEJLUqRqXQnmJeKV5RXUddu2+UKzL
	fgg+6FTBUvXrD2H5PMpqm5R4E1jpglOly5GtJYqTqgbw37jOc+fvyfKqjD4LQ8Ixrn0NA3MaOaDyU
	FA42LX1WPEonBUKFv1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7GDR-00GEAG-Eu; Tue, 11 Jan 2022 12:25:29 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7GDO-00GE9q-Ii
 for ath11k@lists.infradead.org; Tue, 11 Jan 2022 12:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641903926; x=1673439926;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=kOjWqaiFV0550xr2J2a2u0K/5EnSRW3Wa7Fgol+iQZ8=;
 b=USK3QstaU3b4fTDxKtNkxicKeFnpliE5E8S6VXJo/gxR4lxC2TiIQWi1
 3f+s93wGEL2cXmt5zOC9GUwA716otcOfFU5G0PvlBiUHMmVetsTsq0rep
 I65tBOW4l3ZdR7IO01VSw0yDscu8YKzam5SGnLmJO4gb4Rxk0i6tLOvo6
 b6rVwptfO8MUnZVThUE7qdHkDvHFFE4N5e082dkUP5TlfkNe7tZXgf5jy
 +2jDlYugGHkBcJStDB8EQTJ9HUM3CP4twVzufWwaMTEfoJiCK96um7qoy
 gg0FnP/Hxnx6yk13Yf2Wvft4E80WWumjgR66L6axrITVjix7dJvOVjENp w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224169636"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="224169636"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 04:25:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="490361877"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 11 Jan 2022 04:25:23 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1n7GDL-0004s2-2K; Tue, 11 Jan 2022 12:25:23 +0000
Date: Tue, 11 Jan 2022 20:25:14 +0800
From: kernel test robot <lkp@intel.com>
To: Seevalamuthu Mariappan <quic_seevalam@quicinc.com>,
 ath11k@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
 linux-wireless@vger.kernel.org,
 Seevalamuthu Mariappan <quic_seevalam@quicinc.com>
Subject: Re: [PATCH] ath11k: Add debugfs interface to configure firmware
 debug log level
Message-ID: <202201112056.3dHmkXvo-lkp@intel.com>
References: <1641793281-7957-1-git-send-email-quic_seevalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1641793281-7957-1-git-send-email-quic_seevalam@quicinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_042526_673454_20447F39 
X-CRM114-Status: GOOD (  14.98  )
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

Hi Seevalamuthu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kvalo-ath/ath-next]
[also build test ERROR on next-20220111]
[cannot apply to v5.16]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Seevalamuthu-Mariappan/ath11k-Add-debugfs-interface-to-configure-firmware-debug-log-level/20220110-134225
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/20220111/202201112056.3dHmkXvo-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 84654f2733f63dc725a7b3d7c55d56849d2d9358)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/bde7e10605a2c55ec1c333ad64e0f6e2634f4d4a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Seevalamuthu-Mariappan/ath11k-Add-debugfs-interface-to-configure-firmware-debug-log-level/20220110-134225
        git checkout bde7e10605a2c55ec1c333ad64e0f6e2634f4d4a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/net/wireless/ath/ath11k/wmi.c: In function 'ath11k_wmi_fw_dbglog_cfg':
>> drivers/net/wireless/ath/ath11k/wmi.c:7833:25: error: 'struct ath11k' has no member named 'debug'
    7833 |   memcpy(tlv->value, &ar->debug.module_id_bitmap,
         |                         ^~
   drivers/net/wireless/ath/ath11k/wmi.c:7836:13: error: 'struct ath11k' has no member named 'debug'
    7836 |   memset(&ar->debug.module_id_bitmap, 0,
         |             ^~


vim +7833 drivers/net/wireless/ath/ath11k/wmi.c

  7800	
  7801	int ath11k_wmi_fw_dbglog_cfg(struct ath11k *ar, struct ath11k_fw_dbglog *dbglog)
  7802	{
  7803		struct ath11k_pdev_wmi *wmi = ar->wmi;
  7804		struct wmi_debug_log_config_cmd_fixed_param *cmd;
  7805		struct sk_buff *skb;
  7806		struct wmi_tlv *tlv;
  7807		int ret, len;
  7808	
  7809		len = sizeof(*cmd) + TLV_HDR_SIZE + (MAX_MODULE_ID_BITMAP_WORDS * sizeof(u32));
  7810		skb = ath11k_wmi_alloc_skb(wmi->wmi_ab, len);
  7811		if (!skb)
  7812			return -ENOMEM;
  7813	
  7814		cmd = (struct wmi_debug_log_config_cmd_fixed_param *)skb->data;
  7815		cmd->tlv_header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_DEBUG_LOG_CONFIG_CMD) |
  7816				  FIELD_PREP(WMI_TLV_LEN, sizeof(*cmd) - TLV_HDR_SIZE);
  7817		cmd->dbg_log_param = dbglog->param;
  7818	
  7819		tlv = (struct wmi_tlv *)((u8 *)cmd + sizeof(*cmd));
  7820		tlv->header = FIELD_PREP(WMI_TLV_TAG, WMI_TAG_ARRAY_UINT32) |
  7821			      FIELD_PREP(WMI_TLV_LEN, MAX_MODULE_ID_BITMAP_WORDS * sizeof(u32));
  7822	
  7823		switch (dbglog->param) {
  7824		case WMI_DEBUG_LOG_PARAM_LOG_LEVEL:
  7825		case WMI_DEBUG_LOG_PARAM_VDEV_ENABLE:
  7826		case WMI_DEBUG_LOG_PARAM_VDEV_DISABLE:
  7827		case WMI_DEBUG_LOG_PARAM_VDEV_ENABLE_BITMAP:
  7828			cmd->value = dbglog->value;
  7829			break;
  7830		case WMI_DEBUG_LOG_PARAM_MOD_ENABLE_BITMAP:
  7831		case WMI_DEBUG_LOG_PARAM_WOW_MOD_ENABLE_BITMAP:
  7832			cmd->value = dbglog->value;
> 7833			memcpy(tlv->value, &ar->debug.module_id_bitmap,
  7834			       MAX_MODULE_ID_BITMAP_WORDS * sizeof(u32));
  7835			/* clear current config to be used for next user config */
  7836			memset(&ar->debug.module_id_bitmap, 0,
  7837			       MAX_MODULE_ID_BITMAP_WORDS * sizeof(u32));
  7838			break;
  7839		default:
  7840			dev_kfree_skb(skb);
  7841			return -EINVAL;
  7842		}
  7843	
  7844		ret = ath11k_wmi_cmd_send(wmi, skb, WMI_DBGLOG_CFG_CMDID);
  7845		if (ret) {
  7846			ath11k_warn(ar->ab,
  7847				    "failed to send WMI_DBGLOG_CFG_CMDID\n");
  7848			dev_kfree_skb(skb);
  7849		}
  7850		return ret;
  7851	}
  7852	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
