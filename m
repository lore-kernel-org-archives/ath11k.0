Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAF9C001B0
	for <ath11k@archiver.kernel.org>; Mon,  7 Aug 2023 07:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91IRVJX5B7m1554ksm6pOz9ubjTVph3Cn1IkSL0lLdM=; b=aey59saSdY4XNT
	0nR0wPLeJmzJVKoOEj8ZIWRnpvRH7lcMh13WYZzUXqwzVZ2ut8xgtCMt8CdwoNpMIVvhWdbTSn4jF
	zTEm7GCCo2kcO37qv1SDAZApeIW1CUPX6rxB1RB4QikMn5303jCnsIgEaYCTnm+0acqF0tXRqW8yd
	zBXFvbS3VdPetcTXj0u0AxV01y5J8y50KmRrUBv3tBHPR1t8LSYWBi+lmmaSaIRekoIMPD95va8Fq
	w7M02XRI8ifH6SBWfbX250VX4t/PF3D6lblMBsavhniWmNoLW+aNR4yXhObdLUQdyJ1h+jC8ZIW1u
	rJHHWjHx+gQDp1cfa1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSuS0-00GLBv-1c;
	Mon, 07 Aug 2023 07:14:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSuRx-00GLBN-2S
	for ath11k@lists.infradead.org;
	Mon, 07 Aug 2023 07:14:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3775mgqT010133;
	Mon, 7 Aug 2023 07:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=E3tSv98mYAdS1mIT54aLgPgNkcYTeVrG0rWUbo4rGNU=;
 b=dQYj7bvc1Ib/ypaZOb9jHYgl3srzwIYYfhKoQx17Fjf1f5LE+tuIyg3/eUkmvLvNwGcb
 Sz67lsC86dxV2by0G+paydOL52v7LCdBKLoXRpekmVh+0iWzkCvHASwnkgpMOk4k9Dky
 O40JzQOaCXTOp0BfHR4rk1WpvitN8Drd9dZ0sHS0T91oA50vCUWmYFWxqOp47x3b3zkW
 c7tcfSG26ICVlOB/kvxAK4Eiv2A8dCQN9jF8B7IvLVhzwTrpFbyt5a+3ei/Z62Lpvlvq
 +jWDT/X1+8MhU/GM9t1wtZItgmoF5kKK8HNjPr9tJlY8eWYy+CDflS6oGyW9k64WH4Jj Hw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s9fqfar32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 07:14:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3777EgHs004104
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Aug 2023 07:14:42 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 00:14:41 -0700
Message-ID: <545cc8e8-481d-85b2-5692-43580936b48d@quicinc.com>
Date: Mon, 7 Aug 2023 15:14:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] wifi: ath11k: fix boot failure with one MSI vector
To: Kalle Valo <kvalo@kernel.org>,
        Manikanta Pubbisetty
	<quic_mpubbise@quicinc.com>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230601033840.2997-1-quic_bqiang@quicinc.com>
 <87fs70hlel.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87fs70hlel.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m4Z4a1wmi_x-_RDHgKveXV79Gh-TWe9y
X-Proofpoint-ORIG-GUID: m4Z4a1wmi_x-_RDHgKveXV79Gh-TWe9y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_04,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 clxscore=1011 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_001445_819542_495B2D95 
X-CRM114-Status: GOOD (  13.37  )
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


On 6/9/2023 8:26 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>
>> Commit 5b32b6dd96633 ("ath11k: Remove core PCI references from
>> PCI common code") breaks with one MSI vector because it moves
>> affinity setting after IRQ request, see below log:
>>
>> [ 1417.278835] ath11k_pci 0000:02:00.0: failed to receive control response completion, polling..
>> [ 1418.302829] ath11k_pci 0000:02:00.0: Service connect timeout
>> [ 1418.302833] ath11k_pci 0000:02:00.0: failed to connect to HTT: -110
>> [ 1418.303669] ath11k_pci 0000:02:00.0: failed to start core: -110
>>
>> The detail is, if do affinity request after IRQ activated,
>> which is done in request_irq(), kernel caches that request and
>> returns success directly. Later when a subsequent MHI interrupt is
>> fired, kernel will do the real affinity setting work, as a result,
>> changs the MSI vector. However at that time host has configured
>> old vector to hardware, so host never receives CE or DP interrupts.
>>
>> Fix it by setting affinity before registering MHI controller
>> where host is, for the first time, doing IRQ request.
>>
>> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>
>> Fixes: 5b32b6dd9663 ("ath11k: Remove core PCI references from PCI common code")
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> I'm worried if this breaks WCN6750 support. Manikanta, would able to
> test this patch on WCN6750 and let us know if breaks anything?
Hi Manikanta, could you help test this patch on WCN6750?

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
