Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D66EC001DB
	for <ath11k@archiver.kernel.org>; Thu, 10 Aug 2023 04:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzV0bb3WdlHxldwT2V6JBxo07bCpnljQP+5HxL/y6Co=; b=Zy7YgMcE0NGemu
	8T6/zJz4A2gc4qAqKzO414xIrNUfie8UcTemhJpxQONb2sDvMXnQ2UvsqCtB38JLA9EH8EDIveneH
	I7SOys5Z93XstcjOoW0l2r1TgFMtQb3xMVAeRvt19lXLt0MpBLohcCLnHGkg6FMBWR8Apj0GmX3BH
	jDtRk1DKzEV1rK0N/hn4UprqroU96XGccE+oPfzXx4/40wc9JXhsUEHfa/zVUSJUC2+08DSySDemF
	Sq9EZb72QtrIKfSfx8FRBCeffd4cQGEtMI6AAqccmBTGQpHxZ6FXR88z+AryD9fVGhBPQNe54pjvZ
	qP2HMXI0cV15J2wAlpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTxND-006VaG-2Q;
	Thu, 10 Aug 2023 04:34:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTxNB-006VZu-1L
	for ath11k@lists.infradead.org;
	Thu, 10 Aug 2023 04:34:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37A40uxx003109;
	Thu, 10 Aug 2023 04:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=S6kR75ySZnvGmsxssLy9ggxyIjSq4gTPXGHsEqsypTo=;
 b=SdGDsP5o2Kxip8zQe7WQB4ZQ8ADs7jLyzeSnrajFIZi1D0ky8UsUOLv1wZmy7RC7vmNY
 PBn0BOJuztbiI4udlNPnzP9CM3QXMPCAgE2rJ5hb4IYpmdFp6SUlKw27m98n/7+gC1eF
 Ykp6Yyoxo73WJMw6c/QhbT0Fn2VLLKwxjngQBhWSqAg8yaZ39mVfd0nzZl9q8p9wUvWL
 xGPEifx2zZ5izvB9gvcuPJx4Vh6x+qRarqlLrM364Xls4u0XmZtqV28IdogUSpujIUHC
 svla3pCyjT3psHBBSG9Yhn17Ugd+tlyJ0p5p1yc8Zv2yVVSoEJVLR9HlVFffguduRp73 bQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3scbcghhe8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 04:34:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37A4Y1Vf003711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 04:34:01 GMT
Received: from [10.204.118.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 21:33:58 -0700
Message-ID: <85d7c7a3-7a11-bae0-6f37-5da9280792aa@quicinc.com>
Date: Thu, 10 Aug 2023 10:03:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] Revert "Revert "wifi: ath11k: Enable threaded NAPI""
Content-Language: en-US
To: Johan Hovold <johan@kernel.org>
CC: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>,
        Bjorn Andersson
	<quic_bjorande@quicinc.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230809073432.4193-1-johan+linaro@kernel.org>
 <42f78c02-1ddc-cf1c-694f-abf9059dfb60@quicinc.com>
 <ZNNZVsFb3_Dt_NMb@hovoldconsulting.com>
From: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
In-Reply-To: <ZNNZVsFb3_Dt_NMb@hovoldconsulting.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3OdR80ellf5Zx3VsXgJtm23VYCn5uN1W
X-Proofpoint-ORIG-GUID: 3OdR80ellf5Zx3VsXgJtm23VYCn5uN1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_02,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 mlxlogscore=805 mlxscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_213409_593245_9DA2346E 
X-CRM114-Status: GOOD (  21.74  )
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

On 8/9/2023 2:46 PM, Johan Hovold wrote:
> On Wed, Aug 09, 2023 at 02:32:37PM +0530, Manikanta Pubbisetty wrote:
>> On 8/9/2023 1:04 PM, Johan Hovold wrote:
>>> This reverts commit d265ebe41c911314bd273c218a37088835959fa1.
>>>
>>> Disabling threaded NAPI causes the Lenovo ThinkPad X13s to hang (e.g. no
>>> more interrupts received) almost immediately during RX.
>>>
>>> Apparently something broke since commit 13aa2fb692d3 ("wifi: ath11k:
>>> Enable threaded NAPI") so that a simple revert is no longer possible.
>>>
>>
>> This is getting as weird as it would get :)
>>
>>> As commit d265ebe41c91 ("Revert "wifi: ath11k: Enable threaded NAPI"")
>>> does not address the underlying issue reported with QCN9074, it seems we
>>> need to reenable threaded NAPI before fixing both bugs properly.
>>>
>>
>> It seems that the revert has actually solved the issue reported with
>> QCN9074.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=217536
> 
> Sure, but it's only a workaround as the underlying cause has not been
> identified.
> 
>> We were trying to reproduce the problem on X86+QCN9074 (with threaded
>> NAPI) from quite some time, but there is no repro yet.
>>
>> Actually, enabling/disabling threaded NAPI is a simple affair; I'm
>> wondering to hear that interrupts are blocked due  to not having
>> threaded NAPI.
> 
> It sounds to me like the driver's locking is broken if moving to softirq
> processing hangs the machine like this. But I have not had time to try
> to try to track it down besides verifying that reenabling threaded NAPI
> makes the problem go away.
> 
>> What is the chip that Lenovo Thinkpad X13s is having?
> 
> It's a WCN6855 (QCNFA765).
> 

WCN6855 & QCN9074 share the same driver code base since both being PCIe 
devices. One working and another not working seems to be surprising. Do 
you have a dmesg log when this problem occurred?

We are working on to root cause the original problem. The hindrance as 
of today is that we are not able to repro this so far in Qualcomm. We 
are planning to work with the reporter to get more logs.

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
