Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40852CA5FFF
	for <ath11k@archiver.kernel.org>; Wed,  7 Oct 2026 09:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8uCmO+1BAgS2yvpG6z8niC0iA2Pfur9FRxphHCDjWEk=; b=3s6+Xtm4yBMfrb00eqR3wbnjDR
	vJCTBkvE2VgrF7GSl/G/r0DrmKwKE02t+s4BuAeiTNvlh6ceRNLh9Yowd6Tv0H8gvblOG8T/ZYy4Y
	ur8v/bvzAUJZ2XRcEzew/f2yO4z/cz2acm0okCsQH+NlcUbDcEjzf5uK27p7LhFRhAyWzMUIa1G9b
	mccjQfQIv2HBjDT0bXz5ViRd5Msk8XM40Bo02+m2kvbEMQyeEDaIKdmTMmNi+PO813BY7OXYM+9nF
	fHrqCTM3VSZHh1T6JYxDTd6EuVvNktR2LD/4pxofcxvDLyF00diRX6a8PyxWVWWoLF3TUMgN95oKq
	6E6+t+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENh9-0000000224y-0OeE;
	Wed, 07 Oct 2026 09:12:15 +0000
Received: from out-232.mta0.migadu.com ([2001:41d0:1004:224b::e8] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENh6-0000000223y-20d1
	for ath11k@lists.infradead.org;
	Wed, 07 Oct 2026 09:12:14 +0000
X-Envelope-To: ath11k@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=J/y1H3eemnVhW06Ctyt4QVgncGhn8rhFQ+PbyfP1y1s=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791364327; v=1; x=1791969127;
 b=ZVkxtwZt3ZJe6XW1B92izeivSqqn1LIsMOTLykadXsblRXNpsgFBaBbJ8Yokc+ws5ZYEM79e
 FPvn/GVkXzNhxBLhyHwQFi0jY0qcPGgs+yHaRK8J3Ds208S+Uvd0ex1NL8r//ye0cuSwDzKTPzV
 6axXhjt/+dMDDsO4/Mjq3KDn09OhkFtQBOqPBaPL2tiyZbc/ybAT9/GizN2A5zhsh1oObvFdfi4
 mSQKdeMusSXt2MyobsgLiBvY7Z+VDu+ks2NacTqFVIbIpb+kKcrb67o+bJoxccqu2agMbb+Z1M3
 57x40tfZ4rChTEm1p9uwtwRa+pKqnx41RVG/TdnIPrP7w==
X-Envelope-To: ath11k@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7d4030431edfb94a;
	Wed, 07 Oct 2026 09:11:57 +0000
X-Mizu-Trace-ID: 7d4030431edfb94a
X-Migadu-Flow: FLOW_OUT
Message-ID: <f189cfc2-c36a-4bf5-bac7-36ddb15cc7a4@packett.cool>
Date: Wed, 7 Oct 2026 06:11:46 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Val Packett <val@packett.cool>
Subject: Re: [PATCH v5 1/6] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Manivannan Sadhasivam <mani@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 qiang.yu@oss.qualcomm.com
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-1-6dea79786b37@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819-bwscale-v5-1-6dea79786b37@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_021212_945657_96B8C7A6 
X-CRM114-Status: GOOD (  14.54  )
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


On 8/19/26 10:25 AM, Krishna Chaitanya Chundru wrote:
> PCIe host bridge controllers may need their operating point raised before
> retraining to a higher link speed so that hardware resources (e.g., RPMh
> votes on Qualcomm platforms) are available at the requested data rate.
> After retraining, the operating point must be updated to reflect the
> actual negotiated speed.
>
> Add pcie_set_opp() to look up an OPP on the host bridge parent device
> using a key of (per-lane frequency in kHz, LNKCTL2 Target Link Speed
> level).  Keying by generation rather than total bandwidth lets OPP tables
> remain width-independent.
>
> In pcie_set_target_speed(), call pcie_set_opp() before retraining only
> when upscaling (speed_req > cur_bus_speed), since only raising the
> operating point requires pre-staging hardware.  After retraining, call
> pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
> the votes.  Both calls are skipped for downstream ports of PCIe switches,
> as those are outside the host controller's scope.
>
> Some controllers also require ASPM to be disabled around link retraining.
> Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
> pcie_set_target_speed() saves the child device's ASPM state, disables all
> ASPM link states before retraining, and restores them afterward.
>
> Signed-off-by: Krishna Chaitanya Chundru<krishna.chundru@oss.qualcomm.com>
> ---
> [..]
> @@ -176,6 +231,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>   	    !list_empty(&bus->devices))
>   		ret = -EAGAIN;
>   
> +	if (bus && is_rootbus && host) {
> +		if (child && host->disable_aspm_for_retrain)
> +			pci_enable_link_state_locked(child, aspm_state);
> +		pcie_set_opp(port, host, bus->cur_bus_speed);
> +	}
> +
>   	return ret;
>   }

ASPM is not actually reenabled here:

LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <8us
         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
LnkCtl: ASPM Disabled; RCB 128 bytes, LnkDisable- CommClk+
         ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
LnkSta: Speed 2.5GT/s (downgraded), Width x4
         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-


Because as the comment for pci_enable_link_state(_locked) says, "note 
that this does not enable states disabled by pci_disable_link_state(). 
Use pci_force_enable_link_state() for that"!

This needs something like:


diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 4bad311dc7..c54f2658e0 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1709,6 +1709,12 @@
  }
  EXPORT_SYMBOL(pci_force_enable_link_state);

+int pci_force_enable_link_state_locked(struct pci_dev *pdev, int state)
+{
+    return __pci_enable_link_state(pdev, state, true, true);
+}
+EXPORT_SYMBOL(pci_force_enable_link_state_locked);
+
  void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap)
  {
      if (lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
index 623731b96c..530b9047a0 100644
--- a/drivers/pci/pcie/bwctrl.c
+++ b/drivers/pci/pcie/bwctrl.c
@@ -211,7 +211,7 @@

      if (bus && is_rootbus && host) {
          if (child && host->disable_aspm_for_retrain)
-            pci_enable_link_state_locked(child, aspm_state);
+            pci_force_enable_link_state_locked(child, aspm_state);
          pcie_set_opp(port, host, bus->cur_bus_speed);
      }

diff --git a/include/linux/pci.h b/include/linux/pci.h
index 9f20bae6d7..59d7b67c9d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1960,6 +1960,7 @@
  int pci_enable_link_state(struct pci_dev *pdev, int state);
  int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
  int pci_force_enable_link_state(struct pci_dev *pdev, int state);
+int pci_force_enable_link_state_locked(struct pci_dev *pdev, int state);
  void pcie_no_aspm(void);
  bool pcie_aspm_support_enabled(void);
  u32 pcie_aspm_enabled(struct pci_dev *pdev);
@@ -1974,6 +1975,8 @@
  { return 0; }
  static inline int pci_force_enable_link_state(struct pci_dev *pdev, 
int state)
  { return 0; }
+static inline int pci_force_enable_link_state_locked(struct pci_dev 
*pdev, int state)
+{ return 0; }
  static inline void pcie_no_aspm(void) { }
  static inline bool pcie_aspm_support_enabled(void) { return false; }
  static inline u32 pcie_aspm_enabled(struct pci_dev *pdev) { return 0; }

(the addition of the new force+locked variant should go as a separate 
commit, but well)

With that,

Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455

Well, tested without that too, but losing ASPM is not good :)


Thanks,
~val


