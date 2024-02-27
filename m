Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB524C54798
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qe0Tx2ka+A9mGQoK1t7SZ1TAMYNSj6k5fP2hyL0lf6E=; b=WsSCW1oot9BGXLP64aipC67I2V
	fPR/lX2ptiCes9Dke4e6y0RtrIim7mG8/kWkt7zOk+1IzQh6SVk20NAQPMYFUwzRrfIdeEzNurkpt
	IvbTlUyme874vJhMpYAORJJfIdi4QTFDtgFQOHR4DNHZ9p7UYgQzDlHLQM5+kj5OPNwZk2AeXpmns
	OVwAO50KCi4SsBIJcRTva7mW+ukqm0T1rOQVl0OHGFynx2fHm+/0dgI+c9LUCArnq5Anf3tXAN6Pf
	gbYTy1fPD2RJS5eTh4bhMj/FBoba6RJ8wRnntVycDggI9eTT7ezvdWU9pDv4eMgN5R1Qg/yI+CWck
	Yvuy8HZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuI0-00000004dM0-2BqF;
	Tue, 27 Feb 2024 10:02:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reuHx-00000004dKn-20RR
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 10:02:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R9Ycwk010343;
	Tue, 27 Feb 2024 10:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qe0Tx2ka+A9mGQoK1t7SZ1TAMYNSj6k5fP2hyL0lf6E=; b=kk
	AXlMlPYSfzv5aEWSPtAnQP4ZN/RwF7EY2vZidPYnomafFZwLBHtkDVDwM76fjyJd
	iOd+LCOz2szAXyABuCxIc0w3nRYoIX22iCRvhmoQ0KiYlx6alkoqSxgH+BdhyMcf
	BZLSd1vL+YwF3i/oocR0Svqg1nxu/c95jHKtNJtf3W56EFjluvZnOxbUdh/h4LHH
	qVXSteJuoZRbbB5x7lxDThAWkxvGGOgJH8C3xehLfZ/2vtDhPHBg0san8qAGmCdZ
	RA9ftCOjjFWQNa9fcrxjgIh86dWfC0j5y8YKnR9hdtdUAu9OEZbpukAeMw9ROgjD
	Xji0IV0mdBwGCaWC+eNg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh6ws8udt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 10:02:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41RA26nl031869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 10:02:06 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 02:02:05 -0800
Message-ID: <bb25f9cb-720e-4b53-950c-41eddc19da59@quicinc.com>
Date: Tue, 27 Feb 2024 18:02:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] net: qrtr: support suspend/hibernation
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <mhi@lists.linux.dev>
References: <20240227063613.4478-1-quic_bqiang@quicinc.com>
 <20240227063613.4478-3-quic_bqiang@quicinc.com>
 <20240227071531.GD2587@thinkpad>
 <7b743820-850a-4871-a0d8-aded36e11aba@quicinc.com>
 <20240227095602.GK2587@thinkpad>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240227095602.GK2587@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mMmjDsH45GzbprlQkc4a1QEzvh3aF9_g
X-Proofpoint-GUID: mMmjDsH45GzbprlQkc4a1QEzvh3aF9_g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2402270079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_020217_566147_7B6AA239 
X-CRM114-Status: GOOD (  19.40  )
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



On 2/27/2024 5:56 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 27, 2024 at 04:39:41PM +0800, Baochen Qiang wrote:
>>
>>
>> On 2/27/2024 3:15 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Feb 27, 2024 at 02:36:12PM +0800, Baochen Qiang wrote:
>>>> MHI devices may not be destroyed during suspend/hibernation, so need
>>>> to unprepare/prepare MHI channels throughout the transition, this is
>>>> done by adding suspend/resume callbacks.
>>>>
>>>> The suspend callback is called in the late suspend stage, this means
>>>> MHI channels are still alive at suspend stage, and that makes it
>>>> possible for an MHI controller driver to communicate with others over
>>>> those channels at suspend stage. While the resume callback is called
>>>> in the early resume stage, for a similar reason.
>>>>
>>>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>>>
>>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>>>
>>> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>
>>> Could you please confirm if this patch can be applied separately and won't cause
>>> regression?
>> Just searched the kernel and found another two drivers using IPCR channels,
>> one is pci_epf_mhi_driver in drivers/pci/endpoint/functions/pci-epf-mhi.c
>> and the other is mhi_pci_driver in drivers/bus/mhi/host/pci_generic.c.
>>
>> For pci_epf_mhi_driver, this is not impacted because the devices for those
>> channels are attached to mhi_ep_bus_type while QRTR MHI driver attached to
>> mhi_bus_type.
>>
>> For mhi_pci_driver, I am afraid there would be regressions caused by this
>> patch. The regression is because when system suspends, mhi_pci_suspend() is
>> called and then qcom_mhi_qrtr_pm_suspend_late() called, however the latter
>> would fail because MHI is moved to M3 state by call mhi_pm_suspend() in
>> mhi_pci_suspend(). To address this, there might be two options: the first is
>> to move mhi_pci_suspend() to a late suspend stage which would be called
>> after qcom_mhi_qrtr_pm_suspend_late(). and the second is to avoid whole QRTR
>> suspend operation in such cases. I prefer the second one, because if MHI is
>> going to suspend, instead of power down, it is pointless to unprepare MHI
>> channels and re-prepare them after resume back. We can achieve this purpose
>> by adding a status_cb() to QRTR MHI driver which would be called when MHI
>> goes to low power mode. And then QRTR MHI driver could decide not to
>> suspend/resume if low power mode is notified.
>>
>> Your thoughts?
>>
> 
> I'd rather query the MHI state of the device in suspend/resume callback using
> mhi_get_mhi_state(mhi_dev->mhi_cntrl) and if the device is found to be in M3
> (suspend) state, then I'd skip prepare/unprepare part.
> 
> Because this makes it clear that, if the device is in suspend state, then no
> need for the client drivers to unprepare/prepare the channels.
> 
Sounds reasonable, will do accordingly in v3.

> - Mani
> 

