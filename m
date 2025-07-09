Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55756C83F03
	for <ath11k@archiver.kernel.org>; Wed,  9 Jul 2025 14:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9B4s8fPAUq+8Co0FPDyeitn6Joxr+1UQS6Y7uNsks0=; b=FBpo2/1eXm+6CJQo9rGcuLedue
	SUpIyN9+eFUKiMvU7qcqSkT3h+6cWc0a+Bm0rKFaTqtTi9MekCk9hdvWrJeydF8k6iA+jeGf9V8jR
	nsaEWtxTV7N6QBiE3rLtDDGfYjqGkvBYAfuxzuqaYSrqsJApR5fd3c6KuY3q5ZI01hsWv9ic1bTAw
	KKqFinYZDfWvlnzf2hDpVrZAfrmTawjcUCUSIGOv/J78iF6cpQqp+BrVgD5y3KFMXYkSB2oVoehTE
	ZihSyCcCKScNL9YsG8UM0hLdH5U31zljYpG1p/+pKwb5vQS/Salm0XEZd7F09Y85ixVsBsVrmnZK2
	4FCYMayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZW7U-000000092pi-3v8m;
	Wed, 09 Jul 2025 14:50:00 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTn0-00000008bw7-2RbV
	for ath11k@lists.infradead.org;
	Wed, 09 Jul 2025 12:20:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752063642; x=1783599642;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=UNteH8MyHXiNBHTEmoU7+5E+nqt7sFjow0ifKuy1UtE=;
  b=Gb5r8JzYxqRE9kA1YRZd1PgUp/+K4+cMktlLKLOfa2F1TaEC9dLMBJxV
   xAa0o8CarozD+omvZc19MDPE07LpTkrrNqNw9Y10UNTFQibRQDhkCa0uk
   tR7p+PiItbpTS4KLjJ8rhKfVNle0Kbv4S8s3T0DPLiSU8aFMLJteppCQh
   GJpf1HWrTXXrkEfuQFNjIghDu3+9XRDTvOrnR3olmM3FuFbrkJzwFPZC6
   vrN6itEWOtBgdNeL65fQJhZF4kfajo8ZtjvTC2InCs3RFZoDrAqgTpK+7
   XMIgXq/kcP+15Uv8HpOAB5myy64zHq0+bv45x541gGmcWxPqK/YM8p9xX
   w==;
X-CSE-ConnectionGUID: xwn8AcdnRDWAqMQjBp4Bxw==
X-CSE-MsgGUID: 4gRAdE5ER/6ddKsVAPPKmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="71907253"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="71907253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 05:20:42 -0700
X-CSE-ConnectionGUID: 91ZRmtK3R1Ww85xwUSkIDw==
X-CSE-MsgGUID: JL+YOArQQcKFgvjLdZ5K7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="160029712"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.168])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 05:20:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 9 Jul 2025 15:20:32 +0300 (EEST)
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
cc: Manivannan Sadhasivam <mani@kernel.org>, 
    Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
    Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, 
    Jeff Johnson <jjohnson@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
    =?ISO-8859-2?Q?Krzysztof_Wilczy=F1ski?= <kwilczynski@kernel.org>, 
    linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev, 
    linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
    qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com, 
    quic_vpernami@quicinc.com, quic_mrana@quicinc.com, 
    Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 03/11] bus: mhi: host: Add support to read MHI
 capabilities
In-Reply-To: <5625ffa1-f952-4646-a17a-fbbfffcdba2a@oss.qualcomm.com>
Message-ID: <4c68074e-5809-bc4c-185a-88ddcb81f31b@linux.intel.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com> <20250609-mhi_bw_up-v4-3-3faa8fe92b05@qti.qualcomm.com> <ttjbjmixxbzatcfthaucuy3j4hosu4azpizes6ptxjnkzsawa5@5axodfdyjff2> <5625ffa1-f952-4646-a17a-fbbfffcdba2a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_052042_631163_8E674189 
X-CRM114-Status: GOOD (  25.38  )
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

On Wed, 9 Jul 2025, Krishna Chaitanya Chundru wrote:
> On 7/8/2025 10:06 PM, Manivannan Sadhasivam wrote:
> > On Mon, Jun 09, 2025 at 04:21:24PM GMT, Krishna Chaitanya Chundru wrote:
> > > From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> > > 
> > > As per MHI spec v1.2,sec 6.6, MHI has capability registers which are
> > > located after the ERDB array. The location of this group of registers is
> > > indicated by the MISCOFF register. Each capability has a capability ID to
> > > determine which functionality is supported and each capability will point
> > > to the next capability supported.
> > > 
> > > Add a basic function to read those capabilities offsets.
> > > 
> > > Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> > > Signed-off-by: Krishna Chaitanya Chundru
> > > <krishna.chundru@oss.qualcomm.com>
> > > ---
> > >   drivers/bus/mhi/common.h    | 13 +++++++++++++
> > >   drivers/bus/mhi/host/init.c | 34 ++++++++++++++++++++++++++++++++++
> > >   2 files changed, 47 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/common.h b/drivers/bus/mhi/common.h
> > > index
> > > dda340aaed95a5573a2ec776ca712e11a1ed0b52..58f27c6ba63e3e6fa28ca48d6d1065684ed6e1dd
> > > 100644
> > > --- a/drivers/bus/mhi/common.h
> > > +++ b/drivers/bus/mhi/common.h
> > > @@ -16,6 +16,7 @@
> > >   #define MHICFG				0x10
> > >   #define CHDBOFF				0x18
> > >   #define ERDBOFF				0x20
> > > +#define MISCOFF				0x24
> > >   #define BHIOFF				0x28
> > >   #define BHIEOFF				0x2c
> > >   #define DEBUGOFF			0x30
> > > @@ -113,6 +114,9 @@
> > >   #define MHISTATUS_MHISTATE_MASK		GENMASK(15, 8)
> > >   #define MHISTATUS_SYSERR_MASK		BIT(2)
> > >   #define MHISTATUS_READY_MASK		BIT(0)
> > > +#define MISC_CAP_MASK			GENMASK(31, 0)
> > > +#define CAP_CAPID_MASK			GENMASK(31, 24)
> > > +#define CAP_NEXT_CAP_MASK		GENMASK(23, 12)
> > >     /* Command Ring Element macros */
> > >   /* No operation command */
> > > @@ -204,6 +208,15 @@
> > >   #define MHI_RSCTRE_DATA_DWORD1
> > > cpu_to_le32(FIELD_PREP(GENMASK(23, 16), \
> > >   							       MHI_PKT_TYPE_COALESCING))
> > >   +enum mhi_capability_type {
> > > +	MHI_CAP_ID_INTX = 0x1,
> > > +	MHI_CAP_ID_TIME_SYNC = 0x2,
> > > +	MHI_CAP_ID_BW_SCALE = 0x3,
> > > +	MHI_CAP_ID_TSC_TIME_SYNC = 0x4,
> > > +	MHI_CAP_ID_MAX_TRB_LEN = 0x5,
> > > +	MHI_CAP_ID_MAX,
> > > +};
> > > +
> > >   enum mhi_pkt_type {
> > >   	MHI_PKT_TYPE_INVALID = 0x0,
> > >   	MHI_PKT_TYPE_NOOP_CMD = 0x1,
> > > diff --git a/drivers/bus/mhi/host/init.c b/drivers/bus/mhi/host/init.c
> > > index
> > > 13e7a55f54ff45b83b3f18b97e2cdd83d4836fe3..9102ce13a2059f599b46d25ef631f643142642be
> > > 100644
> > > --- a/drivers/bus/mhi/host/init.c
> > > +++ b/drivers/bus/mhi/host/init.c
> > > @@ -467,6 +467,40 @@ int mhi_init_dev_ctxt(struct mhi_controller
> > > *mhi_cntrl)
> > >   	return ret;
> > >   }
> > >   +static int mhi_find_capability(struct mhi_controller *mhi_cntrl, u32
> > > capability, u32 *offset)
> > > +{
> > > +	u32 val, cur_cap, next_offset;
> > > +	int ret;
> > > +
> > > +	/* Get the first supported capability offset */
> > > +	ret = mhi_read_reg_field(mhi_cntrl, mhi_cntrl->regs, MISCOFF,
> > > MISC_CAP_MASK, offset);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	*offset = (__force u32)le32_to_cpu(*offset);
> > 
> > Why do you need __force attribute? What does it suppress? Is it because the
> > pointer is not le32?
> > 
> yes to suppress warnings.

I'm pretty sure sparce with endianness checking won't be happy with that 
construct as you pass u32 where le32_to_cpu() expects __le32. Have you 
checked this with sparse? (It might not check endianness with default args.)

> > > +	do {
> > > +		if (*offset >= mhi_cntrl->reg_len)
> > > +			return -ENXIO;
> > > +
> > > +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, *offset, &val);
> > > +		if (ret)
> > > +			return ret;
> > > +
> > > +		val = (__force u32)le32_to_cpu(val);
> > > +		cur_cap = FIELD_GET(CAP_CAPID_MASK, val);
> > > +		next_offset = FIELD_GET(CAP_NEXT_CAP_MASK, val);
> > > +		if (cur_cap >= MHI_CAP_ID_MAX)
> > > +			return -ENXIO;
> > > +
> > > +		if (cur_cap == capability)
> > > +			return 0;
> > > +
> > > +		*offset = next_offset;
> > > +	} while (next_offset);
> > > +
> > > +	return -ENXIO;
> > > +}

There's a generalization of capability search in Hans Zhang's series, 
can it be used here too?


-- 
 i.


