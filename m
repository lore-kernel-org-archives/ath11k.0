Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034AEC54754
	for <ath11k@archiver.kernel.org>; Tue, 20 May 2025 04:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRkL6ZD37aILbTjnj5L1nOvB0DmK7nmgx/7Bty5lsHA=; b=TO+Ksc06rXqtv7QfEiVEAzxB4B
	K0ERI/dRLLeTEuiSnlEtJhWgLUJgizv7Puy5C3DEbDV9Lmyt/mDkiRVOZ1n1l+tlyZJUggTBsgOIn
	I6yKld/OnN+sOFnl77gUIoLotKoM4GbIQB7iT9hrEfWDQ3abMs0SHvj/K5TWPsbC5WiLmKGF5LwT+
	cpaV2sJcTvOC8eGXeLkegB3mTnFaU20qw2Gq4qJPV8QBqRCo7cFBzn/vfkryTSBjaGlAnj5W2xOe7
	+ym1j97drTbAO6F+YFZorLJomO2uirgHU9bEBwwjF+h9SQCww8Uo9zVMmpriwYMl7wDI9rJvgN371
	bMDU13sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHEEz-0000000BTAi-0FcK;
	Tue, 20 May 2025 04:06:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHEEw-0000000BT9u-3X1o
	for ath11k@lists.infradead.org;
	Tue, 20 May 2025 04:06:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JKjAoa022751
	for <ath11k@lists.infradead.org>; Tue, 20 May 2025 04:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mRkL6ZD37aILbTjnj5L1nOvB0DmK7nmgx/7Bty5lsHA=; b=ok2dYX/2JfvIPoT5
	1EdJ6q1GigS8gpD+pcbPatWPkZVETqe0DYpUc8C50rI0AHNF6NWQuYu6OrO9zTF5
	sc7MlmfF9JG7cGOGVvPfyNhs07LnS3ykzrWV1YpJcyUdrpvOHdcEpWGkJQZYp8no
	5wFcgJJhoKju92/h2mCRC7a0zwME8nqH46J4mKl7Wha4CRpscBqrZNgGm+Z7vuwp
	6dDmpSaDx8aHL7ypmvUw1jY6rWMGHa6a6EqVy4bnYffiExWD3RWgVa0x0zqFYB+C
	WLUIPi54xiZlGU29YULaKW10p095pn4FoqRQpTL1otMeVPAECP3Iwls+a8MlwSQP
	5rlSmw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d2je4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 20 May 2025 04:06:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22e3b03cd64so40147005ad.3
        for <ath11k@lists.infradead.org>; Mon, 19 May 2025 21:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747713965; x=1748318765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mRkL6ZD37aILbTjnj5L1nOvB0DmK7nmgx/7Bty5lsHA=;
        b=N3/nBZf0w3oD5odyA9n3oyJGo7n93dSOdPWhvKbORzRYftkL5QTcIoo7ZTFdSn8vJW
         7djJ1Z2wmgDSigavu29gY47UvOG2S4uT2PKbE3X2rniql1NvoecMWnMIIp6MRtU1xCc2
         rUBLTQTCx/crs7HMUtKwhRRzhCuYvHQ5UlzgzeLO/SHtEWcRWsdjzUNBpZU0IW8hwnLy
         kZXcyaz+lcn5/Vl4r3BtmuFJis+DKTPTXnYYiqnsFw+it6gbwZ9C8F+TUqdgyob5dVRW
         XwuJaTJbeQ2cp4KaK/ynMZ2YEmYSJWJOnhN8pxzovQLSCaMRW6R4rkk94EjOeunWnDGJ
         kCBg==
X-Forwarded-Encrypted: i=1; AJvYcCWAy7ujR9rrJJxNlQBrehaRhrvjlJkSaFh4dKs2ay0d84x94XaHQgbpp1QI5zJTN+XEDSfd2ME=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFNvaUomZ+SqaUWGAD3ukJiqxR2IH/JshaqgXVnIcKJQif/LFS
	ShCG9QRWHeilLLSE2Smp7weYm+9MH99k5C9wpEd+WLs7OUelu1uIBLngoHDunpkeZ9MSbSX+3n7
	h0s6AcKEeazGdCCrVf4+hOy6wG7/WF/OP3urvKd4JlyGQOyQwgt95P7EF31ilHUWK
X-Gm-Gg: ASbGncusjra5aNHicSe9XifZFtm8TA10/njC6XmBF+OxJ/2HUnB8bjY3DwBzlpNr+WK
	EPlvygAX3/OEezIWZ4pwi81GW3WoNBzUnJ5q/fzT30UK07O5RMYZaueoMplSBbMgqHhYJ8faH9K
	BQ2A5WWrkkObf04GObVeaYN0VEADwQgFwIJ2XmWzGSdnP4TndiDsRAcF4ClMmbsQPD0IlX5zpiw
	99Wj7zlaO8HxIHTuofCGzlmGzy7rQQl/74du5OROc8hAS4TM2MzrmrSLzpHKMw85gA52n1zwrLr
	gB9YI1CKPjm4N2cRm82BWatmQNL7zQWbGavuanL7FQ==
X-Received: by 2002:a17:903:1987:b0:223:5e76:637a with SMTP id d9443c01a7336-231d451906dmr235890455ad.23.1747713965026;
        Mon, 19 May 2025 21:06:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCF1HMD5IOIAcLUdbyDa32PLQI1LeHPs7Pwruc6NNnS2Fm+f5VrtQdL4uL+gDaDwT1GlS9+w==
X-Received: by 2002:a17:903:1987:b0:223:5e76:637a with SMTP id d9443c01a7336-231d451906dmr235890025ad.23.1747713964612;
        Mon, 19 May 2025 21:06:04 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e98009sm67639245ad.152.2025.05.19.21.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 21:06:04 -0700 (PDT)
Message-ID: <25723231-c396-2d20-aea1-5e506b44a778@oss.qualcomm.com>
Date: Tue, 20 May 2025 09:35:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 01/11] PCI: Update current bus speed as part of
 pci_pwrctrl_notify()
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_vpernami@quicinc.com,
        quic_mrana@quicinc.com, Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250519-mhi_bw_up-v3-0-3acd4a17bbb5@oss.qualcomm.com>
 <20250519-mhi_bw_up-v3-1-3acd4a17bbb5@oss.qualcomm.com>
 <10de35f5-bec6-5df3-768d-04f88c4e3d77@linux.intel.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <10de35f5-bec6-5df3-768d-04f88c4e3d77@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDAzMSBTYWx0ZWRfXykS/ZEyd+rDf
 CB9ojD/uMv32zBv+IDa7NEVBZg6v9AcFl/zXte8t9BB+c1m8anK6UDL2gUQYNITYGkCTRhUqm3b
 mYHOWWiYQ8ZlQSPbduDYruc9hchQP/iitYLMKXF7NJLCpTl5v4aYwO7Aat0eAGlzd3qiJdvbu3j
 Mnw6rY93Jiwk053AJLpjH9qhaP4JSbK8D82toGeo0GZXRoY56x8pDkzB7Zl/kDdok8XGwp1vo2h
 o6eupSMEDQerWO0gM+2b36i+uiL3eqBlfIHRHD1m6IhJcf41L7nA0qVbvgaz6Qm1kpaPJAhPlv7
 FaXqYB7YR3eFtPHHtpLaJDg7A6ABQE6feOEAmupXn2robsyUwLAAJuNhF4zfRF4npwqhiypEFKt
 odM5K+mI414GPZNCzgzwbZaAiwvWVnXj44NRXKDCbDXeCpguPgtHpm/8QvIsZ3dtC+uQIikz
X-Proofpoint-GUID: tTPr0B1v0fO4SWZiBTHPcsVJGcYwzBo5
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682bffae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=tf4daXCc1kDTc5M98m0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tTPr0B1v0fO4SWZiBTHPcsVJGcYwzBo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_210606_892980_05797A14 
X-CRM114-Status: GOOD (  17.76  )
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



On 5/19/2025 6:39 PM, Ilpo Järvinen wrote:
> On Mon, 19 May 2025, Krishna Chaitanya Chundru wrote:
> 
>> If the link is not up till the pwrctl drivers enable power to endpoints
>> then cur_bus_speed will not be updated with correct speed.
>>
>> As part of rescan, pci_pwrctrl_notify() will be called when new devices
>> are added and as part of it update the link bus speed.
>>
>> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pwrctrl/core.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/pci/pwrctrl/core.c b/drivers/pci/pwrctrl/core.c
>> index 9cc7e2b7f2b5608ee67c838b6500b2ae4a07ad52..034f0a5d7868fe956e3fc6a9b7ed485bb69caa04 100644
>> --- a/drivers/pci/pwrctrl/core.c
>> +++ b/drivers/pci/pwrctrl/core.c
>> @@ -10,16 +10,21 @@
>>   #include <linux/pci-pwrctrl.h>
>>   #include <linux/property.h>
>>   #include <linux/slab.h>
>> +#include "../pci.h"
>>   
>>   static int pci_pwrctrl_notify(struct notifier_block *nb, unsigned long action,
>>   			      void *data)
>>   {
>>   	struct pci_pwrctrl *pwrctrl = container_of(nb, struct pci_pwrctrl, nb);
>>   	struct device *dev = data;
>> +	struct pci_bus *bus = to_pci_dev(dev)->bus;
>>   
>>   	if (dev_fwnode(dev) != dev_fwnode(pwrctrl->dev))
>>   		return NOTIFY_DONE;
>>   
>> +	if (bus->self)
>> +		pcie_update_link_speed((struct pci_bus *)bus);
> 
> Why are you casting here?? (Perhaps it's a leftover).
> 
yeah it is a leftover I will remove it in next patch.

- Krishna Chaitanya.
>> +
>>   	switch (action) {
>>   	case BUS_NOTIFY_ADD_DEVICE:
>>   		/*
>>
>>
> 

