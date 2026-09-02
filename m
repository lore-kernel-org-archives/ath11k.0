Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E729C61DFD
	for <ath11k@archiver.kernel.org>; Wed,  2 Sep 2026 04:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IpYFqn52MzyyerSAhaJx9+MNvz9oY9L3KfTClhX+lTk=; b=G6cFI6DGVHLkmEh/McFCPZttJ4
	3lEBueYZdemFkRylg82O87DPaw1KZhf56/4SU+maidNwPdX0qD3CvwER5sqS/SCHTw19DcEQa17HR
	FqOfQiQ8ffQy0qmQvOK7sU9G5dfnM6DDRDpGk/ReWOva++hPYVuU5R0BoiB/uRm66KHGkhMKpoIgx
	4LfxduTZDqqOiWlPL1ZaScvC19vcCcW2XQRhV5bPubIeZ28fwtTrmEBst/4qxlmnSQKcDuJG17Hcq
	4JK0rRfJyJ4zl07v2o18UwXznE3EwDyKot0eIHmhf/hS0+GBU2Jv1+fjgOYsU7eUMwpPT+axzi8Pq
	2VhWu/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cy8-0000000DmcO-1a8o;
	Wed, 02 Sep 2026 04:53:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1cy5-0000000Dmc3-1jRX
	for ath11k@lists.infradead.org;
	Wed, 02 Sep 2026 04:53:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6824NS824097961
	for <ath11k@lists.infradead.org>; Wed, 2 Sep 2026 04:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IpYFqn52MzyyerSAhaJx9+MNvz9oY9L3KfTClhX+lTk=; b=U4UyBEj7NkKGWdyG
	q1Mw86N1eMYbj6BtBltl9J7A3Z+rgCHPb119lZGYX+tbBY/HGzzj3TpPCEBcetXJ
	4XHJtslfDYoCb3ffmVQ1PqrqP5lWLoidDLlug+RFQ8pZQ03HVcOwjQTD5QWaU5en
	3UxryAXhnO3d6IlcYOZedDq9+5OwmRb3zyi3c3dgniofwggkfUMXuJ7hfiBeWg0a
	wHvcYZnf0YVm352Hgqbz8R7aioJPAdQUFgTWonWPAfzzCd4xJw9yEpq2F9nMje8n
	7hz+fD5fMjARQL6AApAJ7wgacICECaAMu452SzxLIDvqWIs+YU0ZbsB9L/oM2rxu
	Rn/CFA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdynt3geg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 02 Sep 2026 04:52:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so915661a91.1
        for <ath11k@lists.infradead.org>; Tue, 01 Sep 2026 21:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788324779; x=1788929579; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IpYFqn52MzyyerSAhaJx9+MNvz9oY9L3KfTClhX+lTk=;
        b=IiFa2rcT+pK9oUi+REo/HYEThooEKC/BlluPzfKS5WCVlYz/MIXkpfpGP/6rdZDp4u
         asKESJrD0sNsxMGYtbCWLc9AdnaR1Xvq5X6IqayR+BMDR8PruSb4VBsmVGB7+rKXGzhC
         M/SiJ4XXsOECFCp5mHm3mGMb91zs428ZDyoPYexZQp/wJvMP1SCyv61Yit6E2M8QVKds
         z9Dz4xDvBiW5YC0VOcSm/hguJZlmTMJAiDcMyHDt7mV/0fyGaEUnX6fYGAPLALCXXGRZ
         ixxnxm+8Bvle8zA6vouyWbaPj5xWZQbDJtG4yqP+hwP7UgdHGZwvtAUA18fGuF1xe+AU
         szaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788324779; x=1788929579;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IpYFqn52MzyyerSAhaJx9+MNvz9oY9L3KfTClhX+lTk=;
        b=g8Q8soMRVM837lvwGoojT+xqrBGO201ElA7qLpx7XHm247AZxB7fufdO+wA2RXfVSO
         vmyAM55XmfTmYKCZw3uwWV3Dq3WxOdyNZRDntAL/Flazaa3aiEekkGFDIhkcifxH8M/w
         F5o87KVycpaGp4VNb8gFBE9CIqb34i+HhC71QbZ4q8ffq9yAE5QnwHSFjkusYUAEIgpc
         fS2tL0osFIr2OtMi79FSN2CW1IbxM/Z5UBQAEA/4dHKF3t8ZsFulCIM/3A2ECnlhW4a1
         yDAyYMkIpvGpYuea5QS2OgU8kHrWUyrtievP/RvoT3Pf4g7JVhbV2U8teSFyw+/M5Ynx
         OOrA==
X-Forwarded-Encrypted: i=1; AKwUvBzAl2ntWBUgSUNLgF3ZNASwPvl4hjz7BK0T7Zytn3mCv5qyMr9gKJ8h0IAjPK5vQ2xtbUxe/ek=@lists.infradead.org
X-Gm-Message-State: AFuF++liQHes5YyfWQ5O4xpTCiO6ycKBfWY2vBeKpUu6ActvJ6gUrRg+
	h4/tytm8EqeQkbj6eECdGkOCGVIHBAEBu5aimXE6Gv1/YfYBc3fmok57p2Phmm4g3tFL6X27ZNH
	5tw1E5gA6XQKvka6eXYcqCNqwi3tDvac5Fr1/GCDgc3xdTFjgd6ntkLvtEh/DZcn8lIto2pf8
X-Gm-Gg: AYBFou04WRqiX6ReypVuQTCef0KUcA/iszIS18tVNoYFHWVixVXsZCFpVMJD6krreu+
	Zz1mRpHkRm/57FTzWTlRx/6zydeeqOG08tnksKyL0/pb/hiJHJhIi2FLEScAxiK0pX1JHTbeLiT
	ijUO854dSPHM0jx3SeNztsQAGs/W6gZUCB8CcPKSSpVl7odHgUUIkj6gJipezPpCD95+zxLa+vm
	REDDFjXZcNFvzqlm2oCEf4FLMBElAGGEZfaZ5Cfob2ie45TiE3f9JHIjYxyngnq6kM6O2PR1fCz
	sNlCn+fiXQIcdlIetv+IuO0cojFpJg7LKoUFuNOpjjDwFnCnA+rjcb2mfksJGwBKNBUNFG0XeTM
	2m3oXzGVrk1UNvFuKjlJMoKx8jhMqpRHY
X-Received: by 2002:a17:90b:35c8:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39aedf43130mr3258296a91.10.1788324778547;
        Tue, 01 Sep 2026 21:52:58 -0700 (PDT)
X-Received: by 2002:a17:90b:35c8:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-39aedf43130mr3258234a91.10.1788324778096;
        Tue, 01 Sep 2026 21:52:58 -0700 (PDT)
Received: from [10.218.35.45] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14310adaeaasm1068788c88.10.2026.09.01.21.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 21:52:57 -0700 (PDT)
Message-ID: <5c3f1611-275e-4664-b3e2-748da6d210ed@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:22:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-1-6dea79786b37@oss.qualcomm.com>
 <atba2336nxz566wvbfrvclbx7yyma5elhnojb7ozz4ku6dk3q3@c2wa24laiqyd>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <atba2336nxz566wvbfrvclbx7yyma5elhnojb7ozz4ku6dk3q3@c2wa24laiqyd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MSBTYWx0ZWRfX3vxvo7iuIIoE
 mf0+qoasf9HDDydwSaq/0m/EOgnretp4CWTBltFCPIOWscwTgJCAfGKmBvXYWDYu2BuaretadIv
 cg8xz2RrZZFhWpwcwnC6Ldd0K/iu3zPxNMR7KZ46FCOUjQzZIZoK5VXY3zobQnxXWb++UpmleT4
 u3pIbxOOsH9u6GikrqZeKTAmkQ+2Rn9JsWKFhIBCYuwi5ltdb/jndMXfSsLNpC5lQmt5fzX3BKX
 Rj7yDTAXPIOQ8TXiZ1WmG0Trycv6xpLkQ9JppuzrDJ+JJgm1qvZigEYRUPj0orhyYWfxMYe7zlG
 HJogSbN7cnO2GkRHdgT45r9yT+3wRxQiKv67gvx9mXwt8ne03IWrQGVFwEyP5kBcBoAMW8l3zvI
 XdhZF+DgsqnmMZeMB0s8wY1m4FV64jV6UdSTyHADwS/ZFEqZpMEtSoosE6CHednFZ4wnSV26R16
 WbA5q41Hi1jEQTA073Q==
X-Proofpoint-ORIG-GUID: mEC8P3VdWGKNW6zCAgQx9YZwHU6owOSj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MSBTYWx0ZWRfX62DrdWXaZNrN
 JBcB+8YUlR+QODpr5f+7bLDVkW62Xnr9z3SVJm4DU6wHsvWHnTSL8Qvy8LYoWttd4Ba92ksZd9p
 VEFPVz5ZNv0NxGIWmT3FO/YkEfv5Ioc=
X-Authority-Analysis: v=2.4 cv=LfkMLDfi c=1 sm=1 tr=0 ts=6a97abab cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6HI80psrSe5n1y8aGwAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: mEC8P3VdWGKNW6zCAgQx9YZwHU6owOSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_215301_578509_2825307F 
X-CRM114-Status: GOOD (  33.38  )
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



On 9/1/2026 1:12 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 19, 2026 at 06:55:52PM +0530, Krishna Chaitanya Chundru wrote:
>> PCIe host bridge controllers may need their operating point raised before
> Use either "Host Bridge devices" or "PCIe controllers".
>
>> retraining to a higher link speed so that hardware resources (e.g., RPMh
>> votes on Qualcomm platforms) are available at the requested data rate.
>> After retraining, the operating point must be updated to reflect the
>> actual negotiated speed.
>>
>> Add pcie_set_opp() to look up an OPP on the host bridge parent device
>> using a key of (per-lane frequency in kHz, LNKCTL2 Target Link Speed
>> level).  Keying by generation rather than total bandwidth lets OPP tables
>> remain width-independent.
>>
>> In pcie_set_target_speed(), call pcie_set_opp() before retraining only
>> when upscaling (speed_req > cur_bus_speed), since only raising the
>> operating point requires pre-staging hardware.  After retraining, call
>> pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
>> the votes.  Both calls are skipped for downstream ports of PCIe switches,
>> as those are outside the host controller's scope.
>>
>> Some controllers also require ASPM to be disabled around link retraining.
>> Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
>> pcie_set_target_speed() saves the child device's ASPM state, disables all
>> ASPM link states before retraining, and restores them afterward.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>  drivers/pci/pcie/bwctrl.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++-
>>  include/linux/pci.h       |  1 +
>>  2 files changed, 63 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
>> index c4c8d260bf96..6fa1522c47db 100644
>> --- a/drivers/pci/pcie/bwctrl.c
>> +++ b/drivers/pci/pcie/bwctrl.c
>> @@ -28,9 +28,11 @@
>>  #include <linux/mutex.h>
>>  #include <linux/pci.h>
>>  #include <linux/pci-bwctrl.h>
>> +#include <linux/pm_opp.h>
>>  #include <linux/rwsem.h>
>>  #include <linux/slab.h>
>>  #include <linux/types.h>
>> +#include <linux/units.h>
>>  
>>  #include "../pci.h"
>>  #include "portdrv.h"
>> @@ -120,6 +122,38 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>>  	return pcie_retrain_link(port, use_lt);
>>  }
>>  
>> +static int pcie_set_opp(struct pci_dev *pdev, struct pci_host_bridge *host,
>> +			enum pci_bus_speed speed)
>> +{
>> +	struct device *dev = host->dev.parent;
>> +	struct dev_pm_opp_key key = {};
>> +	int ret, freq_mbps, width;
>> +	unsigned long freq_kbps;
>> +	struct dev_pm_opp *opp;
>> +	u16 lnksta;
>> +
>> +	pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
>> +	width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
>> +
>> +	freq_mbps = pcie_dev_speed_mbps(speed);
>> +	if (freq_mbps < 0)
>> +		return -EINVAL;
>> +
>> +	freq_kbps = freq_mbps * KILO;
>> +	key.freq = freq_kbps;
>> +	key.level = pci_bus_speed2lnkctl2(speed);
>> +	key.bw = 0;
> 'key' is already 0 initialized above.
>
>> +	opp = dev_pm_opp_find_key_exact(dev, &key, true);
>> +	if (!IS_ERR(opp)) {
>> +		ret = dev_pm_opp_set_opp(dev, opp);
>> +		if (ret)
>> +			dev_err(dev, "Failed to set OPP for freq (%lu): %d\n",
>> +				freq_kbps * width, ret);
>> +		dev_pm_opp_put(opp);
>> +	}
>> +	return 0;
>> +}
>> +
>>  /**
>>   * pcie_set_target_speed - Set downstream Link Speed for PCIe Port
>>   * @port:	PCIe Port
>> @@ -140,9 +174,12 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>>  int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>  			  bool use_lt)
>>  {
>> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
>> +	bool is_rootbus = pci_is_root_bus(port->bus);
>>  	struct pci_bus *bus = port->subordinate;
>> +	struct pci_dev *child = NULL;
>> +	int aspm_state = 0, ret;
>>  	u16 target_speed;
>> -	int ret;
>>  
>>  	if (WARN_ON_ONCE(!pcie_valid_speed(speed_req)))
>>  		return -EINVAL;
>> @@ -152,6 +189,24 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>  
>>  	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>>  
>> +	/*
>> +	 * The host bridge driver may need to be scaled for targeted speed
> "Host Bridge resources may need to be..."
>
>> +	 * otherwise link might not come up at requested speed.
>> +	 */
>> +	if (is_rootbus && host && bus) {
>> +		/* Get function 0 of downstream device */
>> +		list_for_each_entry(child, &bus->devices, bus_list)
>> +			if (PCI_FUNC(child->devfn) == 0)
>> +				break;
>> +
>> +		if (child && host->disable_aspm_for_retrain) {
>> +			aspm_state = pcie_aspm_enabled(child);
>> +			pci_disable_link_state_locked(child, PCIE_LINK_STATE_ALL);
>> +		}
> You mentioned that the Host Bridge requires disabling ASPM during retraining,
> but here you are disabling ASPM of the downstream device. So the issue is device
> specific or Host Bridge (RP?) specific?
Issue is RP specific, if aspm driver disables the ASPM only when we pass the
child, if the we pass root port dev, it will just return without modifying the
aspm.

Ack for remaining comments.

- Krishna Chaitanya.
>> +		if (speed_req > bus->cur_bus_speed)
>> +			pcie_set_opp(port, host, speed_req);
>> +	}
>> +
>>  	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>>  		struct pcie_bwctrl_data *data = port->link_bwctrl;
>>  
>> @@ -176,6 +231,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>  	    !list_empty(&bus->devices))
>>  		ret = -EAGAIN;
>>  
>> +	if (bus && is_rootbus && host) {
> Maintain an order for this check. I think this order makes sense than the above
> one.
>
>
> - Mani
>


