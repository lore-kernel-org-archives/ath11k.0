Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF614C021AA
	for <ath11k@archiver.kernel.org>; Wed, 19 Feb 2025 17:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZPYXYhznydRoNkH0Kcvg2U8jDI9yURgtXY5VTKjyko=; b=E3FUawFrYyNBK6Yu7Z8U6RVagC
	PvFrRilKiXB0W0QahxmP4RHk7gWM51/jBgvBiGKDQgH+iMBB6aFNfzfStVs/oblYndQz880Eyunv3
	0cMlYGO2AQnEBtRBJpaQiYht7ENjg/f0vlBocFJsmwUrTccMcZaCZ8U3E1l7tFkfOCuEZa/MielPq
	ExQS1li8k03w25jQrvHRWcp2Pnmk/X5RGZyaNX0DAqCHBW6kSZqSStVBvLL36lTJyEv1IxuuvhHVJ
	23WcegAarnHSvZNIHKGeGgpzRqjBWdBNyFAlVns+ZxYNIfKv5v4tP+2znpCiU1Wa/ZZ0fmAoZAUi5
	Z33mAuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoLe-0000000EENF-20dR;
	Wed, 19 Feb 2025 17:59:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoLb-0000000EELl-2QKX
	for ath11k@lists.infradead.org;
	Wed, 19 Feb 2025 17:59:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGF3U4031994
	for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 17:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RZPYXYhznydRoNkH0Kcvg2U8jDI9yURgtXY5VTKjyko=; b=PscXiEyBqT9oImjr
	DFubEALiRiOyR2Gck+mvk+zM7IYu3Zd6Lu+mYqBLHt6p5SjWEk9/HJVlYhTYQz60
	j1QXksRrA3taY8NCfFDngNHvgoop6FXffcl1BBJ43j9eeMSCecXOZwwUo96ARn3j
	GKZWpVIh45VZbmTsroHh+xzwIHYVrgHh9eLscZ+2BKqxb3FQOgzMvNnZRn5zZQLe
	n+fCVkTUbKjHERsTCKYqgfwr3nfvcacsSM80R+4uWAQi6hkK2IpOQPF/8HW4Vdd6
	ZitGL/o5uWzT+BPlLjhCpJNaqKz9Gt30ZKVpB6jzuH58QsgQHzleB9D1o3fXmZPt
	NSa0xw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5bgwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 17:58:58 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-220cb5924a4so224459715ad.2
        for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 09:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739987937; x=1740592737;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZPYXYhznydRoNkH0Kcvg2U8jDI9yURgtXY5VTKjyko=;
        b=CtorG/Cy/ieAaIGO4QQ6LGoI3rv76EilQoXIxNgZbYlkYbkAypxO6HYpn66FSUTk7Y
         zX+grikioT250KVkquki792nVEBicpwQhZ20JGUX/la0LN3tMzmvEQB8sLlMXCx1tg4b
         xsefBslE3WVUG2KArAmR0Tr4cedVXHWiltARsIMB0/yTMXQxWLRU2X0QFF17AzauWbW+
         ezUXtLzxhWzqTTF256Wr1E1u9hEn5c0by3Iml6GfRV87HF1yZpKb8jNAuXUFUQ0PI8Xw
         K6hx0/vPopGdobqbdRxgqrVU8c/ZvrkyFPH3KsHaevDs25dRAV4gDa2qfAyptNZBUD3y
         vg8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe2JxKM2LJme1eGptHYAxHbbIQtbnmsvEfGHhjTLsVLrVE6JnBtheN4m1YHM3vZ2xuaq6iAGg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKaP/HM0SvfAd7LLxj+S42ujS+Q8uKNyN23MAr2jnd+XW1HaFn
	ZjyOa3SuGaziQqZfIcVQ4j+7mAUbWChs9JMFyBmEJM53V/9b5UDJhXg2uLGbKqy0m2OtljVt/eV
	CjG90+T1U1Dci4gEB156U2PiwY2+TMrb6d3gT5QyfAnFMg+ep4U5bv7Q9mkdq
X-Gm-Gg: ASbGncspxR8XRByHvxCfzBSunjWlutHtXXqxB74JY47QbD0VR9+X0EsR/IwvOMsfbpq
	KAbGKdr1cdcje3wutfvcPp8RFffxsVQOmxvbikr8drTc9mtm5ZWC5PXKl3GLuYTbDr/2i6MCwlD
	rl4Y661w8wVYTqjomPsfCAQy6jcpZqCX1AGhEUf4EB/F1zM5ZJkQiwX59XkQLKG0owp10Ckd7WO
	Gt0BIGWG6P5AOPSTZaRYuqfGvuNU/exA7srOnCBUA1PvDNyMbvS5/KMaXz5rbAxw0ujJlpm2sk1
	KIkRdXcPsm6QlPiq7blb9izeZaV+dEVWka4=
X-Received: by 2002:a17:902:f543:b0:21f:542e:dd0a with SMTP id d9443c01a7336-221040a99d9mr278372525ad.41.1739987937112;
        Wed, 19 Feb 2025 09:58:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUYFCEoZHriB5wecTnOAu53AMlZezfTLFnsL8ikE+PkMeZB3Iwnzg0FnHSPGIoH3cIgQ5kgg==
X-Received: by 2002:a17:902:f543:b0:21f:542e:dd0a with SMTP id d9443c01a7336-221040a99d9mr278372065ad.41.1739987936755;
        Wed, 19 Feb 2025 09:58:56 -0800 (PST)
Received: from [192.168.29.92] ([49.43.231.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d536b047sm107696615ad.101.2025.02.19.09.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 09:58:56 -0800 (PST)
Message-ID: <f0e5efb7-8ea0-a064-21e4-6d7596b1a9ae@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 23:28:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 4/8] PCI: dwc: qcom: Update ICC & OPP votes based upon the
 requested speed
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, quic_jjohnson@quicinc.com,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com
References: <20250218220728.GA194681@bhelgaas>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250218220728.GA194681@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZbTuB-GDAHHFbHuOluFR_I0q4YOR6HCF
X-Proofpoint-GUID: ZbTuB-GDAHHFbHuOluFR_I0q4YOR6HCF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_07,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_095859_736989_408F635B 
X-CRM114-Status: GOOD (  21.43  )
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



On 2/19/2025 3:37 AM, Bjorn Helgaas wrote:
> Make subject line match history for this file.
> 
> On Mon, Feb 17, 2025 at 12:04:11PM +0530, Krishna Chaitanya Chundru wrote:
>> QCOM PCIe controllers needs to disable ASPM before initiating link
>> re-train. So as part of pre_bw_scale() disable ASPM and as part of
>> post_scale_bus_bw() enable ASPM back.
> 
> s/needs/need/
> 
> Why does Qcom need to disable ASPM?  Is there a PCIe spec restriction
> about this that should be applied to all PCIe host bridges?  Or is
> this a Qcom defect?
> 
It is QCOM controller issue, PCIe spec doesn't mention to disable ASPM.
>> Update ICC & OPP votes based on the requested speed so that RPMh votes
>> gets updated based on the speed.
> 
> s/gets/get/
> 
>> Bring out the core logic from qcom_pcie_icc_opp_update() to new function
>> qcom_pcie_set_icc_opp().
> 
> This refactoring possibly could be a separate patch to make the meat
> of this change clearer.
> 
ack.

- Krishna Chaitanya.
>> +static int qcom_pcie_set_icc_opp(struct qcom_pcie *pcie, int speed, int width)
>> +{
>> +	struct dw_pcie *pci = pcie->pci;
>> +	unsigned long freq_kbps;
>> +	struct dev_pm_opp *opp;
>> +	int ret, freq_mbps;
>> +
>> +	if (pcie->icc_mem) {
>> +		ret = icc_set_bw(pcie->icc_mem, 0,
>> +				 width * QCOM_PCIE_LINK_SPEED_TO_BW(speed));
>> +		if (ret) {
>> +			dev_err(pci->dev, "Failed to set bandwidth for PCIe-MEM interconnect path: %d\n",
>> +				ret);
>> +		}
>> +	} else if (pcie->use_pm_opp) {
>> +		freq_mbps = pcie_dev_speed_mbps(pcie_link_speed[speed]);
>> +		if (freq_mbps < 0)
>> +			return -EINVAL;
>> +
>> +		freq_kbps = freq_mbps * KILO;
>> +		opp = dev_pm_opp_find_freq_exact(pci->dev, freq_kbps * width,
>> +						 true);
>> +		if (!IS_ERR(opp)) {
>> +			ret = dev_pm_opp_set_opp(pci->dev, opp);
>> +			if (ret)
>> +				dev_err(pci->dev, "Failed to set OPP for freq (%lu): %d\n",
>> +					freq_kbps * width, ret);
>> +			dev_pm_opp_put(opp);
>> +		}
>> +	}
>> +
>> +	return ret;
> 
> Looks uninitialized in some paths.

