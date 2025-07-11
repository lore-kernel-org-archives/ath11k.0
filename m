Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD93C83F1B
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 23:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PpsrmMj0uiPokNCQ1Eqhmb2HaTUqbDl1MR+USJW6LE=; b=R8VaXfdj+kOeo5vXaoIfFLkpEp
	AdkNZZcEd1yxeZLDBSGUSpSpcmM50Q9K41X2Mxc4PKege3zZSfKYN0mC+B4LxvOXWmmib5r57DjdK
	Ckaj0Fz7qhc8B+sXQtMCrHwJZlv9NSvZm861ttnotU06UH8Q8+NfKGtBbaaIihhZEWpsXyFpobyan
	nfL0RT/kog6Mj+EqEsYLUPWxxoUhnMUC0/VI3+3AsF2dysOeKYyYINExpelW9OtkDGFVJkXULTvlc
	CjbhEjOFkyS7TVAqf1ZFM/kjp8Be5MfV4B0DAfDnLb4EMBWKiQeLm0J3vTNTDleMQSsKjBkuLBI35
	LlCY3Odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMuU-0000000G0ce-2xqN;
	Fri, 11 Jul 2025 23:12:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMuS-0000000G0cI-2cFn
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 23:12:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB3Jxq031220
	for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 23:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PpsrmMj0uiPokNCQ1Eqhmb2HaTUqbDl1MR+USJW6LE=; b=AM69r9ABrIKlQY4s
	YxvXrJg3dr1YOkoMN/GSblbDv2QbivqBF22HGq+bXcKJEk7KLQiiAsbq/A1GWWhk
	FE9fFuCzFLb/2jH3edDr0HjaNnP9vEuL+t8pmMQ1/3XfCihqy489xCSPoZ8eFQLG
	7i7Wxj+jZclQEVZZmWKMomCFGMYLWiGOT3BYZKLLCsQQsRcjbD74DfRbzY40NMx+
	F5ykAy+u/jXlpNkVH40wRQvxiZww30ViGur6KVDBjOMgTAm4rr1nR6ifu0v7QiOb
	rs+VnAdMC3/wmL+hI27ytiJlyBOQ6tV8gQd5zK1K4h9u+sdLvCJY3z06XruS3MFm
	taMmzw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbet4mu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 23:12:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b1ffc678adfso2024121a12.0
        for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 16:12:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752275523; x=1752880323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0PpsrmMj0uiPokNCQ1Eqhmb2HaTUqbDl1MR+USJW6LE=;
        b=D8/IcHwKbK+goa3DDnpI+ib2UKR6jUxEvIKiWodK+thW2SyC8I+mHa2NibEmaK4D/m
         5AiUWwuAq4lbzsYwvYO9WtuOnqpswyviqQ5n5gMXn0KBOiIQVg6aTneVrtBqmeoLcAqN
         sVayPD4idEP1vVWtonocEv+pC+GMH+cHL2kmgc4jvlXWjnCfH4svbEvskIGHu6S0FIlG
         JwJd/axF/mz13qwFUeYfoxKWZA8IPVdUQziO1xz/JIxk6IhWfkmFoPMi6leCKfB1Bi6F
         KgWBEhkc4M7WViha3DFGeMWz2wTLQgwQQvv7mcwnyVlUDKsn9uS4wo5rbmSjgwjCbQE9
         9YKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWh10LWgk1tTbR57kGTukW4TWbvvCHfgrdrQaS8sQ832Zsn3nEHdsVeNUXLoufT2HUDin0rR0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcvqy59DY4h5i4/9YSW6UYeIffGR7uJzDCNuGxdvcSKCcEiZvG
	Ty06kdnEDKPg6fclQ6gK4SRSaiKZeNTpL/F2pGAJxhNTBXUayPsASH/bbdku4UtQyZF3Qjo7xjQ
	8uVcI2cf1h/muPRBiVrmMBaccM5Z9b9XVrUKgqM412xR7gui9jcrItmNFpNaz9EUf
X-Gm-Gg: ASbGncuZM1EKv5uq1HW1E1Hy7nMyfdCRCHfn14tiI7z5UCkpFwLvojUo72sUvdZhJX6
	Zd/3WKiYOFAMhv78ghD2HLBebX8A7BrncsZ7rSHS56d6J25dfQZl8g7hn0RQd0b8LR9kpDmH7Y5
	WDAHL/EOFdsuvtz1kWoqMWZXDTU+1srRmUB/kLIyUdTiqcV+fgkfqcpER/VZkKzvdZ7s0C5uNFm
	626Z/7WIdXPOji+zIMGyymDKfLzbgholb2yrhyGe41Cpw4Q02UTTRNxEq2dL8GXzkc/seS1/18E
	GarwSIDDuRI08s9HAOA/G1+QQn9KMbQOxUneUYVqquK7ePqNGttEEiPM2XIZnyO3E0W0
X-Received: by 2002:a05:6a20:d43:b0:220:3252:bb7b with SMTP id adf61e73a8af0-2312080596dmr8768283637.31.1752275523086;
        Fri, 11 Jul 2025 16:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeK7rgvIuioPJc9Djm6BWHu8SfUaUakg+lxMCli0qXD/9xlsegC+9TSbITmlPNQmxFFiKNlw==
X-Received: by 2002:a05:6a20:d43:b0:220:3252:bb7b with SMTP id adf61e73a8af0-2312080596dmr8768238637.31.1752275522626;
        Fri, 11 Jul 2025 16:12:02 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.227.1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd59f1sm5742585b3a.3.2025.07.11.16.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 16:12:02 -0700 (PDT)
Message-ID: <b9647055-a9f2-4016-a7b1-81c15a0d82c1@oss.qualcomm.com>
Date: Sat, 12 Jul 2025 04:41:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] PCI: qcom: Add support for PCIe
 pre/post_link_speed_change()
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250711212952.GA2308100@bhelgaas>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250711212952.GA2308100@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE3NiBTYWx0ZWRfX7s6edH//fIQm
 D8OPcaf/jCqFITST/IkvKNTvm8Dsb7I2zsk3wxYnGcVoslMi1saOXRgFd6Agn82WXIey1espyXn
 yqoU0MF2+Y1xPbri1AMZmI6nKOC94vYrQpxZ/ZUF2SQ7fGNyfiJPucAoVzsaNcgrDXV1yc9hYU8
 uIY4/xSN60ZrFUV+WsppIrgTzXWa3qwMS7dDCCW9NwECSXgu9dRMKXQ/ktHjs/KMaLwb6qJiBiT
 xwn1CYFIDdK9FQTAbsDNREdGM0z1Z6A2fYKMDm+wDFgHUYhpDCxE37jVNC2K9fm81CCBqgsi0iu
 gZTrrFZfWxPDFmjq+5W5kNf0M8uOH/0FPkgctbiBIWrArwHAbpThY5PAPc/UFI0gp4n0F32w1xs
 XsxIZVGBOSZaJmG/pLuER1coWwJk0rLPmPtIFHGXock5E7YTDOS21KymtDdL+1+Q6mtnY38a
X-Proofpoint-GUID: s5bdx4UC8Lvug3Y4N00UIPSM-nfGNmfI
X-Proofpoint-ORIG-GUID: s5bdx4UC8Lvug3Y4N00UIPSM-nfGNmfI
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=68719a44 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=4nqOr+EkFiuPl9GB/B4vcQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=40onBu3kYIFXMOwlT5wA:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507110176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_161204_670558_D16B0C89 
X-CRM114-Status: GOOD (  13.93  )
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



On 7/12/2025 2:59 AM, Bjorn Helgaas wrote:
> On Mon, Jun 09, 2025 at 04:21:29PM +0530, Krishna Chaitanya Chundru wrote:
>> QCOM PCIe controllers need to disable ASPM before initiating link
>> re-train. So as part of pre_link_speed_change() disable ASPM and as
>> part of post_link_speed_change() enable ASPM back.
> 
> Is this a QCOM defect?  Or is there something in the PCIe spec about
This is QCOM issue only.
> needing to disable ASPM during retrain?  What about
> pcie_retrain_link()?  Does that work on QCOM?
After disabling ASPM will work pcie_retrain_link().

- Krishna Chaitanya.
> 
>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>> @@ -276,10 +276,16 @@ struct qcom_pcie {
>>   	struct dentry *debugfs;
>>   	bool suspended;
>>   	bool use_pm_opp;
>> +	int aspm_state; /* Store ASPM state used in pre & post link speed change */
> 
> Whatever this is, it's definitely not an int.  Some kind of unsigned
> thing of specified size, at least.

