Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C96CA6007
	for <ath11k@archiver.kernel.org>; Thu,  8 Oct 2026 05:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eQV9p9UYhsQ3ApYT0Wh4i0ldneTjolAW8NyWSQEXrtU=; b=rFjtyQ0HN05ZQHg5OSfilW9bY9
	y+9zgeGjcFApUnDv/F7HBx3ZCHeIHZUENdpxUy3pAviMGziWV2V1eIoFnJJcXQhdm0Nur8CEHmhem
	gFlgSDnJ/115dH04hQ4iIqkuTVTl/BUCNVsskKpyWPRx1w2i3hnivJJSzMAfeus6OdtcRxAcqwByn
	4JiJAgJXBZCUEqicsWheUVy2oO00W1I1kLBKb0PM+DS/jrHdlOwqDwIvYw/tRuN4s78IIYsobjt+a
	sblBAZsWCgv/w1+CWS1uu7MjeipebHrNTq6J22qhQhS0S9zjLvWXPN3z9+Vu8oLpCN8Oae9KIBpNO
	m1USjKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEh3D-00000003Zib-4APV;
	Thu, 08 Oct 2026 05:52:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEh3A-00000003ZiF-3fkQ
	for ath11k@lists.infradead.org;
	Thu, 08 Oct 2026 05:52:19 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BXAE1157823
	for <ath11k@lists.infradead.org>; Thu, 8 Oct 2026 05:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eQV9p9UYhsQ3ApYT0Wh4i0ldneTjolAW8NyWSQEXrtU=; b=Ny2TzCJVR2wZYgLe
	QbVAU/dgqbupsn9ExdPxgbi6YZmWbKmmx8V5YH1dZFf9uB8kUnQcO3P8WvvgZVGb
	+ENAlmVMtF8R9+Q+s42e2mVu/xweeWKpkmC2+hT8lyJtdhCgn9iWRI11rg1z37sR
	ITodF/lToSxtGSWJrHNX+vh5fQyN9jXW/x64b1uEc8O+XEQh29Aiy5hGvClyQub4
	GNs4e5B0mdiYVp44k5NZ4uGyiyckfqIDMhRl/+3cDzv6FF/jKuY9K3mZn9lPdocY
	A2yvs+vYGUhg6TfqgEh+KvFE7FRVmOFIf8RMCdm1cNaHaE3mV4YMoIj2TVJa63y2
	RIpH5g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51b5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 08 Oct 2026 05:52:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so50355835ad.3
        for <ath11k@lists.infradead.org>; Wed, 07 Oct 2026 22:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791438735; x=1792043535; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eQV9p9UYhsQ3ApYT0Wh4i0ldneTjolAW8NyWSQEXrtU=;
        b=J7bNy934KWKAyzo5X59e/gSAtS2cwWAFNh/K79Zi4/U8FUFZ1NGOdOHTEfEwvn1Vuj
         oPzucwum3CPk5A0J3/ESsnZ+ByzYKgUjTJYM+fDLqHi1aU/n6a1/4ufsTE8PROO4F1ev
         sOuIGxwPJQgOeKOt8lOll02bAmB26dLHPdSv8s/lKwwHZUFYz/fwNohE3o0ye0Dqf5mf
         a9lfHIq0JU8/W9CY24uh60yif4u362CI8BAyr+PJpbdbgqBkMjsYk5E6ofRbM7E+JOet
         /Lvo4yuLTUFLzM5FpgOSF1gCBYke54ZpF1MYMZzfgXcjCUk08A9xBHxF8hwLK2P+/LFI
         hhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791438735; x=1792043535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eQV9p9UYhsQ3ApYT0Wh4i0ldneTjolAW8NyWSQEXrtU=;
        b=ytiKe3nzghEvNBLr7iw4tQfFCE1oMeNEKNwCQK3A9mOTSASZIxYJpUmriY15sjkkrL
         fbkS4UIdJ0NBOvYgAK5GlGcXDd+K9av4R7zMxI8K2osa61msIkYMBWkqoIG/X6lPpd5M
         T+GJ1ph4iqx04FwAA4FuVq1yA7grGYfH2e7J+fQriDus4t0mEOL5PppK789uE+wK2W/Q
         h1sz4t42xWTIMGVTyfp9tzI4T+G+/Cf9qbYVSE/xNNMDBrXCOfEeeVsoFqZgVu7oHfj5
         95nNaZrm+I1IGgo5CG6LrKLCTFEu0k4rSV2+uOfeFAL6HKFYlbezeEDBGZ9Y7V0Exp4B
         DF9g==
X-Forwarded-Encrypted: i=1; AKwUvBxIwL8RTOQzFSfby8W/KPgKy2aa9caRXkzpvkUaJcscPjWScM+H6vmSPz+qh04kAM396omOHQY=@lists.infradead.org
X-Gm-Message-State: AFq9FYJycBoYisn7Wb+fTdp+3Q891Zmd93XOqhlT6+redvKO0bG6Mij4
	xmiE9I9FaWYXlrtHYjVRqtFiQyTutFS2XdhWgTQlLQg4C/TalV63WsnHQwzXyG9R9WG0Fyy46ve
	VhYd29WNfn9IQSnVSV4XIDiGebcOqcmBaxeN1Pd8kyjtJwPd38yqQ0QdPb1hZsf5mdANITJxP
X-Gm-Gg: AYBFou3vJZTdaYXvxxVzSjnygKWioigFwg9zd+IlNE4RZJKTIJvcSlEkmQR3HslEOuu
	5Ip08LEsRwKAyvHFUUrfyal7GS30A73cc4U9V6cHLHdOfqHztXhTphZ9IjYGLll+vXw3XNHgdlU
	o4w8qELr1DmllVv9LLXfXgngN1+EBgRwmr/CLzIyDpMn91MDwUzuJPCBHfIwUk0aU4aKrblsiD5
	u0cCLqKeSNXDFahsbyo7iJINPxcI33rO583Aqx+/xEPIHh8Efp8fwlH9xnhqnLpmpVgnADbZIcv
	sQ0DJgt179aIfBKlZFIzYoRexp2wm9UaZCjuqRVNgmo8iDhAMuGxPK2MvhFbzJcgqM+LE5FYObe
	N75s/qEWmF5JqUExwCCJ3Hp7b2eentdYy
X-Received: by 2002:a17:90b:17c2:b0:3a8:10e2:acfc with SMTP id 98e67ed59e1d1-3a8a1ceec9cmr3579225a91.65.1791438734940;
        Wed, 07 Oct 2026 22:52:14 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:3a8:10e2:acfc with SMTP id 98e67ed59e1d1-3a8a1ceec9cmr3579214a91.65.1791438734295;
        Wed, 07 Oct 2026 22:52:14 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a79babsm2629601a91.6.2026.10.07.22.52.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 22:52:13 -0700 (PDT)
Message-ID: <ad34ebc7-df81-414f-848c-0d5b820227b8@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 11:22:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/6] PCI/bwctrl: Set host bridge OPP and optionally
 disable ASPM around link retraining
To: Val Packett <val@packett.cool>, Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com
References: <20260819-bwscale-v5-0-6dea79786b37@oss.qualcomm.com>
 <20260819-bwscale-v5-1-6dea79786b37@oss.qualcomm.com>
 <f189cfc2-c36a-4bf5-bac7-36ddb15cc7a4@packett.cool>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <f189cfc2-c36a-4bf5-bac7-36ddb15cc7a4@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pKxFLta-NHIEuNuanE-TVHH1kLQcJxtz
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac72f8f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6HI80psrSe5n1y8aGwAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfXzbyiE1OvY/Sl
 a066Bzo4pYE4gfs1jsCEBU3z4W+6Kyv9G1BQfLnFXlEpxqWxC6euAHtCwNt7Qfa8Kn3KGbEoo4D
 WZT208auU/wLpKKzpuuiiwIVprxGPQE=
X-Proofpoint-GUID: pKxFLta-NHIEuNuanE-TVHH1kLQcJxtz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyMyBTYWx0ZWRfX4DlmSf1hzZ4d
 mbVsXiHmrf/zUHWAsNtbyzYGT3tqpR6PYLII5IfzkJzcuxGPQ2kCr77NVD5clBK0Ng2Ln+LXa1F
 E0WSc2GBzVkryiFVLG+Cm4E/3qVFgmzRLQ4dK5iE8hLPjfKEul9RK35bu+NCCISW/xdEQGbr/hF
 N1bV/28MCLkwQsqyHNx+fnf7+qpzyJMstpYxjwg1z6H5eQ0GJ0KofCCAnKXmBIkIE+hg/Yrk89U
 HSUdaLic0B0Udfs3kpDOPL3WQWJF6lMtcJ6xYKBdglGNdjPyR5wPptGZNk3ntYxum3DDCJMEd5h
 8VzRd+x7WyABSr9cU5y0DGuImBJmD+MrRn+RpIsB+NGaYm4B6N0xxu8tlB1GsX9qpGO+s7m+Mzj
 YJdu9nXZBQhOw41oFp/hw0JNT/aavMXFoez+T6w7wi/++DE6ClBxD0wd6um6ZXlyPkIjTRBXGER
 4evDx9gcORStbohSQmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_225216_942327_EC038061 
X-CRM114-Status: GOOD (  28.63  )
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



On 10/7/2026 2:41 PM, Val Packett wrote:
>
> On 8/19/26 10:25 AM, Krishna Chaitanya Chundru wrote:
>> PCIe host bridge controllers may need their operating point raised before
>> retraining to a higher link speed so that hardware resources (e.g., RPMh
>> votes on Qualcomm platforms) are available at the requested data rate.
>> After retraining, the operating point must be updated to reflect the
>> actual negotiated speed.
>>
>> Add pcie_set_opp() to look up an OPP on the host bridge parent device
>> using a key of (per-lane frequency in kHz, LNKCTL2 Target Link Speed
>> level).  Keying by generation rather than total bandwidth lets OPP tables
>> remain width-independent.
>>
>> In pcie_set_target_speed(), call pcie_set_opp() before retraining only
>> when upscaling (speed_req > cur_bus_speed), since only raising the
>> operating point requires pre-staging hardware.  After retraining, call
>> pcie_set_opp() unconditionally with the actual cur_bus_speed to settle
>> the votes.  Both calls are skipped for downstream ports of PCIe switches,
>> as those are outside the host controller's scope.
>>
>> Some controllers also require ASPM to be disabled around link retraining.
>> Add a disable_aspm_for_retrain flag to pci_host_bridge; when set,
>> pcie_set_target_speed() saves the child device's ASPM state, disables all
>> ASPM link states before retraining, and restores them afterward.
>>
>> Signed-off-by: Krishna Chaitanya Chundru<krishna.chundru@oss.qualcomm.com>
>> ---
>> [..]
>> @@ -176,6 +231,12 @@ int pcie_set_target_speed(struct pci_dev *port, enum
>> pci_bus_speed speed_req,
>>           !list_empty(&bus->devices))
>>           ret = -EAGAIN;
>>   +    if (bus && is_rootbus && host) {
>> +        if (child && host->disable_aspm_for_retrain)
>> +            pci_enable_link_state_locked(child, aspm_state);
>> +        pcie_set_opp(port, host, bus->cur_bus_speed);
>> +    }
>> +
>>       return ret;
>>   }
>
> ASPM is not actually reenabled here:
>
> LnkCap: Port #0, Speed 16GT/s, Width x4, ASPM L1, Exit Latency L1 <8us
>         ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> LnkCtl: ASPM Disabled; RCB 128 bytes, LnkDisable- CommClk+
>         ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt- FltModeDis-
> LnkSta: Speed 2.5GT/s (downgraded), Width x4
>         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>
>
> Because as the comment for pci_enable_link_state(_locked) says, "note that
> this does not enable states disabled by pci_disable_link_state(). Use
> pci_force_enable_link_state() for that"!
>
> This needs something like:
>
>
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 4bad311dc7..c54f2658e0 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1709,6 +1709,12 @@
>  }
>  EXPORT_SYMBOL(pci_force_enable_link_state);
>
> +int pci_force_enable_link_state_locked(struct pci_dev *pdev, int state)
> +{
> +    return __pci_enable_link_state(pdev, state, true, true);
> +}
> +EXPORT_SYMBOL(pci_force_enable_link_state_locked);
> +
>  void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap)
>  {
>      if (lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
> index 623731b96c..530b9047a0 100644
> --- a/drivers/pci/pcie/bwctrl.c
> +++ b/drivers/pci/pcie/bwctrl.c
> @@ -211,7 +211,7 @@
>
>      if (bus && is_rootbus && host) {
>          if (child && host->disable_aspm_for_retrain)
> -            pci_enable_link_state_locked(child, aspm_state);
> +            pci_force_enable_link_state_locked(child, aspm_state);
>          pcie_set_opp(port, host, bus->cur_bus_speed);
>      }
>
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 9f20bae6d7..59d7b67c9d 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1960,6 +1960,7 @@
>  int pci_enable_link_state(struct pci_dev *pdev, int state);
>  int pci_enable_link_state_locked(struct pci_dev *pdev, int state);
>  int pci_force_enable_link_state(struct pci_dev *pdev, int state);
> +int pci_force_enable_link_state_locked(struct pci_dev *pdev, int state);
>  void pcie_no_aspm(void);
>  bool pcie_aspm_support_enabled(void);
>  u32 pcie_aspm_enabled(struct pci_dev *pdev);
> @@ -1974,6 +1975,8 @@
>  { return 0; }
>  static inline int pci_force_enable_link_state(struct pci_dev *pdev, int state)
>  { return 0; }
> +static inline int pci_force_enable_link_state_locked(struct pci_dev *pdev,
> int state)
> +{ return 0; }
>  static inline void pcie_no_aspm(void) { }
>  static inline bool pcie_aspm_support_enabled(void) { return false; }
>  static inline u32 pcie_aspm_enabled(struct pci_dev *pdev) { return 0; }
>
> (the addition of the new force+locked variant should go as a separate
> commit, but well)
>
> With that,
>
> Tested-by: Val Packett <val@packett.cool> # x1e80100-dell-latitude-7455
Thanks Val for testing and pointing the ASPM issue, there is actually patch
for this[1], I missed this new API change, I will fix in the next series.

[1] [PATCH v3 2/8] PCI/ASPM: Add pci_force_enable_link_state() API -
Manivannan Sadhasivam
<https://lore.kernel.org/all/20260708-pci-aspm-fix-v3-2-6bd72451746e@kernel.org/>

- Krishna Chaitanya.
>
> Well, tested without that too, but losing ASPM is not good :)
>
>
> Thanks,
> ~val
>


