Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53C8C54798
	for <ath11k@archiver.kernel.org>; Tue, 27 Feb 2024 08:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVGFFRDr9JaBIZ0whrl533f9t1vVl71AvWaZ++sgrSQ=; b=Rzi0TU09NMm3On62hzzU0DGd5x
	8pGS6GfT2NX5zGMsHARCTtqYEp8XaY+rUBd7lSuVqPpf6Dlc/sNR1IIVDIufTPcFvuEJwi9c/ky3N
	MwLoFMMgZ5BGfOyx56+R4Om3wlKdN1ee7EX9M0NpECw7HUlNyO2XKvYypph15L/mgAv3B6oBYUh3S
	MwoJcjug/RxO/TdWGZauEa3p1Ph0EDCY9gib4EKNcLDEwfS00Cma87R7941jFvG+EgKXL955+A/4y
	CXCkO0cbsaNQlph1UdBWFA1UddNFHuVea+shdKQgq8zeL795PKPywZN0XuCGGVUIJzSC3hGzgc3gD
	D/G2jUbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ret0F-00000004LG4-08V9;
	Tue, 27 Feb 2024 08:39:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ret0C-00000004LEw-0bEi
	for ath11k@lists.infradead.org;
	Tue, 27 Feb 2024 08:39:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41R40dbF017226;
	Tue, 27 Feb 2024 08:39:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=uVGFFRDr9JaBIZ0whrl533f9t1vVl71AvWaZ++sgrSQ=; b=nN
	G3nYayJl2wyroBk/jOjAX/0+N+dUu/XR0YJm/FfbtRX9n4HjfxQNLfESs+ORUEHr
	Mw3qrZJXwRGGku9OKEQoU/iWzH0DkAzeoDHAmgxxugiZbx0H8N8l3r2C/A3qXLao
	JDdHRG4Ofz622iKl1YrtMbN38oaFOUfcD4ajESXgWH9U+DEQBQsZNN7ebYnR2ZUa
	IPR9u/3X0w6HGa+GKZqRdcFXvPiMiN8Qf4sqhrsrvv7i9xJ69blZQ4shAcZ6Eybb
	KwSuhnYdTI9D5DE5CB7UYFCYPMfjF8Ecoha+ALnNrKrNiJdE3ppozIm4X3kXM95o
	kwH7DqjT/xHukBCboS0w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wh8auggnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 08:39:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41R8dkdU022850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Feb 2024 08:39:46 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 27 Feb
 2024 00:39:44 -0800
Message-ID: <7b743820-850a-4871-a0d8-aded36e11aba@quicinc.com>
Date: Tue, 27 Feb 2024 16:39:41 +0800
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
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240227071531.GD2587@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5gsdWGLxCr9R672uuB2L1r9-j4_qo7EH
X-Proofpoint-GUID: 5gsdWGLxCr9R672uuB2L1r9-j4_qo7EH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402270067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_003952_252400_CBB47DEC 
X-CRM114-Status: GOOD (  23.19  )
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



On 2/27/2024 3:15 PM, Manivannan Sadhasivam wrote:
> On Tue, Feb 27, 2024 at 02:36:12PM +0800, Baochen Qiang wrote:
>> MHI devices may not be destroyed during suspend/hibernation, so need
>> to unprepare/prepare MHI channels throughout the transition, this is
>> done by adding suspend/resume callbacks.
>>
>> The suspend callback is called in the late suspend stage, this means
>> MHI channels are still alive at suspend stage, and that makes it
>> possible for an MHI controller driver to communicate with others over
>> those channels at suspend stage. While the resume callback is called
>> in the early resume stage, for a similar reason.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Could you please confirm if this patch can be applied separately and won't cause
> regression?
Just searched the kernel and found another two drivers using IPCR 
channels, one is pci_epf_mhi_driver in 
drivers/pci/endpoint/functions/pci-epf-mhi.c and the other is 
mhi_pci_driver in drivers/bus/mhi/host/pci_generic.c.

For pci_epf_mhi_driver, this is not impacted because the devices for 
those channels are attached to mhi_ep_bus_type while QRTR MHI driver 
attached to mhi_bus_type.

For mhi_pci_driver, I am afraid there would be regressions caused by 
this patch. The regression is because when system suspends, 
mhi_pci_suspend() is called and then qcom_mhi_qrtr_pm_suspend_late() 
called, however the latter would fail because MHI is moved to M3 state 
by call mhi_pm_suspend() in mhi_pci_suspend(). To address this, there 
might be two options: the first is to move mhi_pci_suspend() to a late 
suspend stage which would be called after 
qcom_mhi_qrtr_pm_suspend_late(). and the second is to avoid whole QRTR 
suspend operation in such cases. I prefer the second one, because if MHI 
is going to suspend, instead of power down, it is pointless to unprepare 
MHI channels and re-prepare them after resume back. We can achieve this 
purpose by adding a status_cb() to QRTR MHI driver which would be called 
when MHI goes to low power mode. And then QRTR MHI driver could decide 
not to suspend/resume if low power mode is notified.

Your thoughts?

> 
> - Mani
> 
>> ---
>>   net/qrtr/mhi.c | 27 +++++++++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>
>> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
>> index 9ced13c0627a..e96b82a6742c 100644
>> --- a/net/qrtr/mhi.c
>> +++ b/net/qrtr/mhi.c
>> @@ -118,6 +118,32 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>>   };
>>   MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>>   
>> +static int __maybe_unused qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
>> +{
>> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
>> +
>> +	mhi_unprepare_from_transfer(mhi_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused qcom_mhi_qrtr_pm_resume_early(struct device *dev)
>> +{
>> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
>> +	int rc;
>> +
>> +	rc = mhi_prepare_for_transfer_autoqueue(mhi_dev);
>> +	if (rc)
>> +		dev_err(dev, "failed to prepare for autoqueue transfer %d\n", rc);
>> +
>> +	return rc;
>> +}
>> +
>> +static const struct dev_pm_ops qcom_mhi_qrtr_pm_ops = {
>> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
>> +				     qcom_mhi_qrtr_pm_resume_early)
>> +};
>> +
>>   static struct mhi_driver qcom_mhi_qrtr_driver = {
>>   	.probe = qcom_mhi_qrtr_probe,
>>   	.remove = qcom_mhi_qrtr_remove,
>> @@ -126,6 +152,7 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
>>   	.id_table = qcom_mhi_qrtr_id_table,
>>   	.driver = {
>>   		.name = "qcom_mhi_qrtr",
>> +		.pm = &qcom_mhi_qrtr_pm_ops,
>>   	},
>>   };
>>   
>> -- 
>> 2.25.1
>>
> 

