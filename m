Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED0BC64ED8
	for <ath11k@archiver.kernel.org>; Mon, 27 Feb 2023 10:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oUjmcjPf0GU5ns5wcJjcn7VFR+UFFpPW7njluGgEu8=; b=LWD+QuQOoxJk1G
	jqH7SZAvlxSajxVtgvQDN9hBc6Qq4uBY1j2pFjsax15uX6WxHhj0X5UYsfZzciHzUluKc4bDlCg9Z
	2DulzzSFO672kwuD7dkTpXVS1ttLEp1c19Tm/6GvHoWyCd0/Uj8k/7mhzkeT4AMLKot53T0u83uCy
	av48KM0KYaVedaajhoJ+sYo8RcVEVad07QDjcGCTxNZT00xNV1wUPxosL3+jbvkdBQ3o3oVMBaSlQ
	ZbIAMoaKscmGWWOM6ZH0LdHJ6gn/cSplJOKpY6iqEahKzwnNj5CSg8ByekOU9s6Ioy26HZciyjfeY
	oK5Lv9yVxsDFmYXfechg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWb53-009I5q-3M; Mon, 27 Feb 2023 10:50:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWb4z-009I4k-Bo
	for ath11k@lists.infradead.org; Mon, 27 Feb 2023 10:50:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RAnI9B017902;
	Mon, 27 Feb 2023 10:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=8zZz7+KLT2jaOK03BBPpTPgfJZAJLRgBTGoo0IrtCMU=;
 b=EBLxxO848eBEiz5KSbNPgOpOcwcBsSE19S7xqpr+EQ637Qm8+MZhlu+dSbC/IxKuEZNp
 03tjPNJztYYounvr4qnVNqUBTgCXuiBlEC7SLVJasYWjmar5xN6oNErWf53JF0r4t1bz
 ay51TV7gwlKEvGiuOirwNrR0J6BwTbhdUSS209uUQEDNO1UHLFqKWSgr6Vi669xVxEbL
 kMH43Q/45Kejdca6duBnS4z9tJss3TQ3GFoVUEiz/u2dadRLdibiPuQtlK0VgsiATI7u
 WkpVOQ0E6wNCgRfE0jdH9B9QC8utA3pJp15QTMP65h9vb+6NtxPXa3D4z1Ioa+yhvkrf zw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p0u3jr022-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 10:49:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 31RAnvJU017085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Feb 2023 10:49:57 GMT
Received: from [10.206.66.42] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Mon, 27 Feb
 2023 02:49:55 -0800
Message-ID: <8deddc68-3aa0-fc1b-5cec-1c74935a0333@quicinc.com>
Date: Mon, 27 Feb 2023 16:19:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 0/3] Enable low power mode when WLAN is not active
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230203060128.19625-1-quic_mpubbise@quicinc.com>
 <878rgnru59.fsf@kernel.org>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <878rgnru59.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: qaajmIxwAsqgLM8RN-COCjtRFqMri7xc
X-Proofpoint-GUID: qaajmIxwAsqgLM8RN-COCjtRFqMri7xc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-26_22,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_025001_624366_C98F1813 
X-CRM114-Status: GOOD (  14.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 2/24/2023 8:24 PM, Kalle Valo wrote:
> Manikanta Pubbisetty <quic_mpubbise@quicinc.com> writes:
> 
>> Currently, WLAN chip is powered once during driver probe and is kept
>> ON (powered) always even when WLAN is not active; keeping the chip
>> powered ON all the time will consume extra power which is not
>> desirable for battery operated devices. Same is the case with non-WoW
>> suspend, chip will not be put into low power mode when the system is
>> suspended resulting in higher battery drain.
>>
>> Send QMI MODE OFF command to firmware during WiFi OFF to put device
>> into low power mode.
>>
>> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.16
>>
>> Manikanta Pubbisetty (3):
>>    ath11k: Fix double free issue during SRNG deinit
>>    ath11k: Move hardware initialization logic to start()
>>    ath11k: Enable low power mode when WLAN is not active
> 
> Please add "wifi:" to all patches.
> 
> And please add "wifi: ath11k:" to the cover letter.
> 

Sorry, I have missed adding the prefix. I'll fix this.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
