Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D6DC021B0
	for <ath11k@archiver.kernel.org>; Wed, 19 Feb 2025 17:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=78pq2Tqo6aDU3KcPcf25D+KEq6BDiVBvwf3/VKY2io8=; b=tovZ6AvtdayPg/jGb46IOngN3y
	HR7CRFOVaK3I6zukEBSd//5jhW5deGLnySLkGaUJNuh/fPSIiIrHi4VWgqvnleLO4OEMlbkuxBlH4
	KccWT0z8LovsZsAt0O9qYhSn5U2vkLITSC4sSHa8ZHEswsARh/WMKy3N3rpaZ3/EAgxBJSdxiWGvj
	IyeIjEVKMaZ1cJwp2DYyLKg8kejggNK++OaOt4VoCSeYpMzLfWMp7gtC4CAfXblYbLs90vMXE+YcX
	StjpcDRjLcoGSJL9aiXGoRrJ1QbHhS9l7ts+rUTXfA/pNBJHGusvhxvP+abu7D5lFkYij1kyV+CFp
	rKx2pPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoKI-0000000EDrJ-05ob;
	Wed, 19 Feb 2025 17:57:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkoKF-0000000EDpw-1fRA
	for ath11k@lists.infradead.org;
	Wed, 19 Feb 2025 17:57:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JHJ5uc015031
	for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 17:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	78pq2Tqo6aDU3KcPcf25D+KEq6BDiVBvwf3/VKY2io8=; b=N1SRxA3GvUcj7Xqp
	Zct5UGrRdxIZr9OJ9HrX5AKk53IOsaWHvFVVw5Tg9VrG1vtsKTaxAOZUv5earOHM
	d6NdHHFhu/Jbziz6+Y9V4N/57y9LmqzAO4FzrKuhQgK2MoywQnTIFwShoNXHsezO
	VRuxp7NSfJuwoMra45Y8uLkdEujGC4sDn9QUaifPGpZ11bCDw7xAzCY0Q69gSGyQ
	e3dt8DMBdeJT86l85rFDHJCMqls/PyyLL1TWvunPOFDEdGJJ0CzPpgBDE2nhNNZR
	RS2NM1HSULo1/BuDb5WIoHEAIb+7MWH4yUOgqiiLL0aPltuuuSH6tHXZIiUMlX8l
	OBTm0Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy13gk3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 17:57:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc518f0564so116750a91.2
        for <ath11k@lists.infradead.org>; Wed, 19 Feb 2025 09:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739987852; x=1740592652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=78pq2Tqo6aDU3KcPcf25D+KEq6BDiVBvwf3/VKY2io8=;
        b=vR6h+RCrVdabbAJAKpXmrTrMqUSCTeWKXyWrx0AfH69vkH15F8YImR+GV57tIKgbmb
         KrOjOQtkWVWw3I1Fpi8pyXAUugZEmqk5R2UyhJdn0Xg4+O678aU2f+YHOnPs05A2uEZb
         sPBZqn97lrFeIe+/FonMJ6AIaEnlhd7y/sPIA+QUTf4DJpiOWBj+/qF6Pv+FgMxVwIY7
         SCUiyG0ol4fl9+InzI1yDhk2O0zxXRkk0v6abHfBRQtD3FB+2FQ52hxYiYK94EYpRneW
         /Sz0FTwi/NlY+Xd2qvJ8iOhwtkmO/HuRugMEiVAYB+cSiIuh3m+uEEWql/Zb33brdKhS
         y4mA==
X-Forwarded-Encrypted: i=1; AJvYcCU24nL3kXD7+EGOr1cITOfZ7HWlcDM/P8iRbD9zXSPONktNXUM3BJD7SxoRm7hhyz00nOUGQ3I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBPeEK//+K0YLejjM25TPmw8kP8YAWLA0mHRqNrHC52QWPAxUN
	8odmSsU2aS6W3ukYMAoquodGjkBI64CP59IUPFCIC9Iv8UQwHxH+EWtlBMSGNuTwEb67JDFELM/
	JGwtBUIJQLGxjsrHwPuan3pi2z5lDUAuW2o4Z7FzirQS5TFPGjq6WLLukSYSJ
X-Gm-Gg: ASbGnctZjKvmy5RrUTQ1V9OpVbiK9h+uhsR/YIlEbZk6c6gX8coiPRq4MzRyr954g64
	aa1ys5zDzqfgBCkXSnuIKtE6IMSX9kc65fw6keIpViSduQvcOH9rLi+4n5sM1z1iuQpiluEX6bc
	qY6LgtEMSYG41RSUf38Zn0+la8uwXbBkxfl+hHeqWLprA2Qpn1k8UMRujJGrT5YDLmzBShtUQe9
	UlRYsgVr09dhQBk1IspkYXhRyh1S3bChdnUx19SzjTwfilOiHaFQVBVBgQ+gEcgdPyQiWsWSVj9
	mtZzINjX9odArf5feoc7Ss2wc48qGIhx6cE=
X-Received: by 2002:a05:6a20:6a24:b0:1ee:dcd3:80eb with SMTP id adf61e73a8af0-1eedcd382c1mr3404949637.22.1739987852606;
        Wed, 19 Feb 2025 09:57:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR5P32nd4JPmJkWHQBBmcstlZrG31rBUniS5q+4t2AdRvM+sL+oJVFS4OznQBsMO+V9ZWjlQ==
X-Received: by 2002:a05:6a20:6a24:b0:1ee:dcd3:80eb with SMTP id adf61e73a8af0-1eedcd382c1mr3404894637.22.1739987852215;
        Wed, 19 Feb 2025 09:57:32 -0800 (PST)
Received: from [192.168.29.92] ([49.43.231.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425467b9sm12233766b3a.30.2025.02.19.09.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2025 09:57:31 -0800 (PST)
Message-ID: <915795ea-3e75-fc55-4c37-a05a6570fbbf@oss.qualcomm.com>
Date: Wed, 19 Feb 2025 23:27:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/8] PCI/bwctrl: Add support to scale bandwidth before &
 after link re-training
Content-Language: en-US
To: =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>, linux-pci@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
        mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, quic_jjohnson@quicinc.com,
        quic_pyarlaga@quicinc.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com
References: <20250217-mhi_bw_up-v1-0-9bad1e42bdb1@oss.qualcomm.com>
 <20250217-mhi_bw_up-v1-2-9bad1e42bdb1@oss.qualcomm.com>
 <f58ff91f-95a1-1a0d-91e9-972f0eeddd4c@linux.intel.com>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <f58ff91f-95a1-1a0d-91e9-972f0eeddd4c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 80OsX4_GbXTj99TZvlyY57pLdCgDgV7p
X-Proofpoint-ORIG-GUID: 80OsX4_GbXTj99TZvlyY57pLdCgDgV7p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_07,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502190139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_095735_441728_C8D72EB3 
X-CRM114-Status: GOOD (  25.75  )
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



On 2/17/2025 2:58 PM, Ilpo Järvinen wrote:
> On Mon, 17 Feb 2025, Krishna Chaitanya Chundru wrote:
> 
>> If the driver wants to move to higher data rate/speed than the current data
>> rate then the controller driver may need to change certain votes so that
>> link may come up at requested data rate/speed like QCOM PCIe controllers
>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>> link retraining is done controller drivers needs to adjust their votes
>> based on the final data rate.
>>
>> Some controllers also may need to update their bandwidth voting like
>> ICC bw votings etc.
>>
>> So, add pre_scale_bus_bw() & post_scale_bus_bw() op to call before & after
>> the link re-train.
>>
>> In case of PCIe switch, if there is a request to change target speed for a
>> downstream port then no need to call these function ops as these are
>> outside the scope of the controller drivers.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>> ---
>>   drivers/pci/pcie/bwctrl.c | 15 +++++++++++++++
>>   include/linux/pci.h       |  2 ++
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/drivers/pci/pcie/bwctrl.c b/drivers/pci/pcie/bwctrl.c
>> index 0a5e7efbce2c..e3faa4d1f935 100644
>> --- a/drivers/pci/pcie/bwctrl.c
>> +++ b/drivers/pci/pcie/bwctrl.c
>> @@ -161,6 +161,8 @@ static int pcie_bwctrl_change_speed(struct pci_dev *port, u16 target_speed, bool
>>   int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   			  bool use_lt)
>>   {
>> +	struct pci_host_bridge *host = pci_find_host_bridge(port->bus);
>> +	bool is_root = pci_is_root_bus(port->bus);
> 
> is_rootport ?
> 
ack.
>>   	struct pci_bus *bus = port->subordinate;
>>   	u16 target_speed;
>>   	int ret;
>> @@ -173,6 +175,16 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   
>>   	target_speed = pcie_bwctrl_select_speed(port, speed_req);
>>   
>> +	/*
>> +	 * The controller driver may need to be scaled for targeted speed
>> +	 * otherwise link might not come up at requested speed.
>> +	 */
>> +	if (is_root && host->ops->pre_scale_bus_bw) {
>> +		ret = host->ops->pre_scale_bus_bw(host->bus, target_speed);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>>   	scoped_guard(rwsem_read, &pcie_bwctrl_setspeed_rwsem) {
>>   		struct pcie_bwctrl_data *data = port->link_bwctrl;
>>   
>> @@ -197,6 +209,9 @@ int pcie_set_target_speed(struct pci_dev *port, enum pci_bus_speed speed_req,
>>   	    !list_empty(&bus->devices))
>>   		ret = -EAGAIN;
>>   
>> +	if (is_root && host->ops->post_scale_bus_bw)
>> +		host->ops->post_scale_bus_bw(host->bus, pci_bus_speed2lnkctl2(bus->cur_bus_speed));
> 
> Is the naming of these callbacks too specific for your use case? Does PCIe
> spec actually call changing the Target Speed "scaling bus bandwidth" or
> something along those line?
> 
it is not the PCIe spec, I named based on current driver only. If there
is better name I can modify it.
>>   	return ret;
>>   }
>>   
>> diff --git a/include/linux/pci.h b/include/linux/pci.h
>> index 47b31ad724fa..58f1de626c37 100644
>> --- a/include/linux/pci.h
>> +++ b/include/linux/pci.h
>> @@ -804,6 +804,8 @@ struct pci_ops {
>>   	void __iomem *(*map_bus)(struct pci_bus *bus, unsigned int devfn, int where);
>>   	int (*read)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val);
>>   	int (*write)(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val);
>> +	int (*pre_scale_bus_bw)(struct pci_bus *bus, int target_speed);
>> +	void (*post_scale_bus_bw)(struct pci_bus *bus, int current_speed);
> 
> Please document these, including the locking requirements.
ack.

- Krishna Chaitanya.
> 

