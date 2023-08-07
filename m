Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA23EB64DD
	for <ath11k@archiver.kernel.org>; Mon,  7 Aug 2023 07:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9b5E7P0meocJ4q6RvX267v6JVMYERXYWkfdBxaYMRg=; b=mx2O9zdlD2Vw3n
	fjDgN+ICC8JZgjMVvIslZ/zOx/YeGb4hHWNnv/cr8YAVzE0yRKfbgyWU1tWn6mqh3L024/AMkwaHp
	EgwV3c+BJcqX/c0lxx1nYRuh/qQIOxqWlHU/AaTtg638KIi+YtqyomOwOURvRcC25FAHOAdhTh8SG
	wWE1rlKa8OQ6OV5EDCjVTg9QfM/v0xTEHMn3o9airQRK0KYyGt3LjqPo1DUgsSt0OdHVe6d9SQS67
	5zATsH6ExUDwlxKtnsYS+kJx0LR0219RaKyqABTRPUbd/QL6xWHBiVwqNBzgweTGB1SijSrpFB6zD
	orMZtV5L4Bz89doBRoNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSuaM-00GMMd-2r;
	Mon, 07 Aug 2023 07:23:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSuaJ-00GMLb-1E
	for ath11k@lists.infradead.org;
	Mon, 07 Aug 2023 07:23:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3775UFU7015105;
	Mon, 7 Aug 2023 07:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3wDoO+7e6UMc3eHeW3U35CuvKWUc7EcT+3QPQ0OrXsA=;
 b=H/Rc4UYVrSjKoTB8+n+K41VOOSYl9tg8TsaVhEdf+sPmkK2EcwaudaJ4XcwGI/ykafQf
 jSwUhKt1n2xPwyFdRz7XlG6TZGTJau//rSwxWpUfq+l4cnvTRotCj7bla4ssad2jWtvW
 KNoviGHA9NphVARhirv9GZ9wUT6ru//vlkf9UZbowzz7lltofQDbsGwpWsvVJ4R8hCXz
 A+paTmC9QjKHGgCI1DXNQXo3bf8QDdqG0LCPWPFUYEQ4/ohPTdm6ca8U5cLcS3lN3ET4
 fjafCeCKUi5fPetxn0NLPViolK6/uHNPPz0JilbCgdYbBU/6RbZqrEeYbi22CICJUQ3V 9Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s9eh0tttf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 07:23:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3777NEvC024328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Aug 2023 07:23:15 GMT
Received: from [10.252.212.151] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 7 Aug
 2023 00:23:13 -0700
Message-ID: <897b61ea-36d2-1ab4-9c60-9bdfd2d9cad7@quicinc.com>
Date: Mon, 7 Aug 2023 12:53:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] wifi: ath11k: fix boot failure with one MSI vector
To: Baochen Qiang <quic_bqiang@quicinc.com>, Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230601033840.2997-1-quic_bqiang@quicinc.com>
 <87fs70hlel.fsf@kernel.org>
 <545cc8e8-481d-85b2-5692-43580936b48d@quicinc.com>
Content-Language: en-US
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <545cc8e8-481d-85b2-5692-43580936b48d@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YDSlWwzXLXQkutuUfdZXTmqEHu3xqeCk
X-Proofpoint-ORIG-GUID: YDSlWwzXLXQkutuUfdZXTmqEHu3xqeCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_04,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_002323_559566_AFDC560C 
X-CRM114-Status: GOOD (  12.59  )
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

On 8/7/2023 12:44 PM, Baochen Qiang wrote:
> 
> On 6/9/2023 8:26 PM, Kalle Valo wrote:
>> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>>
>>> Commit 5b32b6dd96633 ("ath11k: Remove core PCI references from
>>> PCI common code") breaks with one MSI vector because it moves
>>> affinity setting after IRQ request, see below log:
>>>
>>> [ 1417.278835] ath11k_pci 0000:02:00.0: failed to receive control 
>>> response completion, polling..
>>> [ 1418.302829] ath11k_pci 0000:02:00.0: Service connect timeout
>>> [ 1418.302833] ath11k_pci 0000:02:00.0: failed to connect to HTT: -110
>>> [ 1418.303669] ath11k_pci 0000:02:00.0: failed to start core: -110
>>>
>>> The detail is, if do affinity request after IRQ activated,
>>> which is done in request_irq(), kernel caches that request and
>>> returns success directly. Later when a subsequent MHI interrupt is
>>> fired, kernel will do the real affinity setting work, as a result,
>>> changs the MSI vector. However at that time host has configured
>>> old vector to hardware, so host never receives CE or DP interrupts.
>>>
>>> Fix it by setting affinity before registering MHI controller
>>> where host is, for the first time, doing IRQ request.
>>>
>>> Tested-on: WCN6855 hw2.0 PCI 
>>> WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3
>>>
>>> Fixes: 5b32b6dd9663 ("ath11k: Remove core PCI references from PCI 
>>> common code")
>>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
>> I'm worried if this breaks WCN6750 support. Manikanta, would able to
>> test this patch on WCN6750 and let us know if breaks anything?
> Hi Manikanta, could you help test this patch on WCN6750?

Sure, we will test and update this here.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
