Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B875C48BF8
	for <ath11k@archiver.kernel.org>; Thu, 22 Feb 2024 07:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psqBUKQGbSXbbAVz6siNfbT5CXvozy5U7okkg1Pdo+U=; b=bK2++nCQfKoD3o/QORuAYJn+jc
	VuQzNy+gKFCvF9kRjt7BTQ3oU7kUUL9ltUD38237WEsJBgvDBRII2+eYqeCGB3qQ6gq+/dvlkASLy
	PoO5xWoCPaxrsgjIdWMjdTSjDLSLr4VUOgByw4os7w1JPrtL0JsJFQ+jncmdCOi+oiQaVbavdt1Kx
	Xbp3K76NA4Ng8lXccYdERALVkc2HOAKV7GR4NXI4ute81bmdRzczmWdc2hYzdyMagygi4RsEFV/Zj
	nWrZAEovhYCEkXUemORTOABh2uUzRhAHxY/hvBtn5XLcQiGNQ5XIqtXSrGfb1TvtWM1pe9z1Cw5rV
	9ZYfEqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3p6-00000003sKf-0HT6;
	Thu, 22 Feb 2024 07:48:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd3p3-00000003sKE-17nF
	for ath11k@lists.infradead.org;
	Thu, 22 Feb 2024 07:48:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41M3kI7X011318;
	Thu, 22 Feb 2024 07:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=psqBUKQGbSXbbAVz6siNfbT5CXvozy5U7okkg1Pdo+U=; b=bI
	kAmb3DoGAkSsJ/hHT6Udv8/yp0Ek0VtrvE99Jya7DTOIY4kv35ENxk+HZcAjTXlH
	dkiV92pNGvT3yGsxXKNEeRDOIqs8Hc61ovtCQcsS6SSWvdsjzb4jrYwIUL8q6nQu
	1WTpmRz2oQPh+paNQbuYVMwcjU50MexPsBF9NnV4AXNZMhI3wslfIKAywW1VFQ1s
	moH8lN5c/CpipQ4LzCILjEGutnj+5wG2AtXPG8RHHwRhp4FVVmLQOpwJHWPFI2T1
	jB8d5AaLRl28/69/ks3zppSRN0fAsiCrcNODH/H0gF3t1EJYiWlbRsQ08AYWdSXU
	ugC2N4ALn/PyiSBAI5BA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wdckvb1jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 07:48:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41M7mlWk029379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 07:48:47 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 23:48:46 -0800
Message-ID: <77f6bbf6-add1-4f3b-9c10-5292e032c758@quicinc.com>
Date: Thu, 22 Feb 2024 15:48:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] net: qrtr: support suspend/hibernation
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath11k@lists.infradead.org>,
        <mhi@lists.linux.dev>
CC: <linux-wireless@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
References: <20240221030026.10553-1-quic_bqiang@quicinc.com>
 <20240221030026.10553-3-quic_bqiang@quicinc.com>
 <dc54be43-e27f-4b5b-9b84-cf0856370abf@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <dc54be43-e27f-4b5b-9b84-cf0856370abf@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: khza-GBEbGNQoETOuHopejsYeNiKfW8u
X-Proofpoint-ORIG-GUID: khza-GBEbGNQoETOuHopejsYeNiKfW8u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_05,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_234849_356240_5EF58FD3 
X-CRM114-Status: GOOD (  21.26  )
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



On 2/22/2024 2:24 AM, Jeff Johnson wrote:
> On 2/20/2024 7:00 PM, Baochen Qiang wrote:
>> MHI devices may not be destroyed during suspend/hibernation, so need
>> to unprepare/prepare MHI channels throughout the transition.
>>
>> The RFC version adds new API to MHI stack with which an MHI controller
>> driver can do unprepare/prepare directly by itself, see
>>
>> https://patchwork.kernel.org/project/linux-wireless/patch/20231127162022.518834-3-kvalo@kernel.org/
>>
>> Although it works well Mani pointed out that the design is not good
>> because MHI channels are managed by MHI client driver thus should not
>> be touched by others. See the discussion
>>
>> https://lore.kernel.org/mhi/20231127162022.518834-1-kvalo@kernel.org/
>>
>> This version changes to add suspend/resume callbacks to achieve the
>> same purpose. The suspend callback is called in the late suspend stage,
>> this means MHI channels are still alive at suspend stage, and that makes
>> it possible for an MHI controller driver to communicate with others over
>> those channels at suspend stage. While the resume callback is called in
>> the early resume stage, for a similar reason.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.30
>>
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> ---
>>   net/qrtr/mhi.c | 29 +++++++++++++++++++++++++++++
>>   1 file changed, 29 insertions(+)
>>
>> diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
>> index 9ced13c0627a..b54a6c2113e9 100644
>> --- a/net/qrtr/mhi.c
>> +++ b/net/qrtr/mhi.c
>> @@ -118,6 +118,32 @@ static const struct mhi_device_id qcom_mhi_qrtr_id_table[] = {
>>   };
>>   MODULE_DEVICE_TABLE(mhi, qcom_mhi_qrtr_id_table);
>>   
>> +static int qcom_mhi_qrtr_pm_suspend_late(struct device *dev)
> 
> Don't your new functions also need to be annotated as __maybe_unused?
OK, will add __maybe_unused in next version.

> 
>> +{
>> +	struct mhi_device *mhi_dev = container_of(dev, struct mhi_device, dev);
>> +
>> +	mhi_unprepare_from_transfer(mhi_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static int qcom_mhi_qrtr_pm_resume_early(struct device *dev)
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
>> +static const struct dev_pm_ops __maybe_unused qcom_mhi_qrtr_pm_ops = {
> 
> this does not need to be __maybe_unused, see below
> 
>> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(qcom_mhi_qrtr_pm_suspend_late,
>> +				     qcom_mhi_qrtr_pm_resume_early)
>> +};
>> +
>>   static struct mhi_driver qcom_mhi_qrtr_driver = {
>>   	.probe = qcom_mhi_qrtr_probe,
>>   	.remove = qcom_mhi_qrtr_remove,
>> @@ -126,6 +152,9 @@ static struct mhi_driver qcom_mhi_qrtr_driver = {
>>   	.id_table = qcom_mhi_qrtr_id_table,
>>   	.driver = {
>>   		.name = "qcom_mhi_qrtr",
>> +#ifdef CONFIG_PM
> 
> conditional compilation isn't necessary here since the 'pm' member is
> always present
Sure, will remove that in next version.

> 
>> +		.pm = &qcom_mhi_qrtr_pm_ops,
>> +#endif
>>   	},
>>   };
>>   
> 

