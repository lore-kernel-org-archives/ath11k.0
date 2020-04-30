Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUHpF-0000Jy-Um
 for ath11k@lists.infradead.org; Thu, 30 Apr 2020 22:38:39 +0000
Date: Fri, 1 May 2020 06:38:19 +0800
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH V3 1/3] nl80211: add support for setting fixed HE
 rate/gi/ltf
Message-ID: <202005010643.4LK4hgmF%lkp@intel.com>
References: <20200429145708.25992-1-john@phrozen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429145708.25992-1-john@phrozen.org>
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: John Crispin <john@phrozen.org>, Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, Miles Hu <milehu@codeaurora.org>
Cc: kbuild-all@lists.01.org

Hi John,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on mac80211/master]
[also build test WARNING on ath6kl/ath-next v5.7-rc3 next-20200430]
[cannot apply to mac80211-next/master]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/John-Crispin/nl80211-add-support-for-setting-fixed-HE-rate-gi-ltf/20200430-040802
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211.git master
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> net/wireless/nl80211.c:4440:47: sparse: sparse: incorrect type in return expression (different base types) @@    expected unsigned short @@    got restricted __le16 conunsigned short @@
>> net/wireless/nl80211.c:4440:47: sparse:    expected unsigned short
>> net/wireless/nl80211.c:4440:47: sparse:    got restricted __le16 const [usertype] tx_mcs_80p80
   net/wireless/nl80211.c:4442:47: sparse: sparse: incorrect type in return expression (different base types) @@    expected unsigned short @@    got restricted __le16 conunsigned short @@
   net/wireless/nl80211.c:4442:47: sparse:    expected unsigned short
>> net/wireless/nl80211.c:4442:47: sparse:    got restricted __le16 const [usertype] tx_mcs_160

vim +4440 net/wireless/nl80211.c

  4431	
  4432	static u16 he_get_txmcsmap(struct genl_info *info,
  4433				   const struct ieee80211_sta_he_cap *he_cap)
  4434	{
  4435		struct net_device *dev = info->user_ptr[1];
  4436		struct wireless_dev *wdev = dev->ieee80211_ptr;
  4437	
  4438		switch (wdev->chandef.width) {
  4439		case NL80211_CHAN_WIDTH_80P80:
> 4440			return he_cap->he_mcs_nss_supp.tx_mcs_80p80;
  4441		case NL80211_CHAN_WIDTH_160:
> 4442			return he_cap->he_mcs_nss_supp.tx_mcs_160;
  4443		default:
  4444			break;
  4445		}
  4446		return le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_80);
  4447	}
  4448	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
