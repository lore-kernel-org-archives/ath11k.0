Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884CFC001B0
	for <ath11k@archiver.kernel.org>; Thu, 10 Aug 2023 06:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JctkenE4YzgZLG+rZPMRzseJyaaMUhqhAS+ezmEgEWw=; b=4fmwz+V0HDm/nE
	B4K8+r47koRuhjzab47kbC9XJ7SYfzEbdnl5FPBT4qsLuoYjHuhQyCsYNZFSsItocsIbqidpgelqD
	1FDC7DLXtEd1VtvI/QIhPrb7qWaHRcu0iLkrTpDJelR4g/EUS9QW4hrDgkRUfq9mLo0N12irQIukM
	MNweTB77qmWqsx4h3sWhpYCfNAWOvzjTeppLA9okTkfp9R0rEnuaGflSV3Ir/U84GI+Z7GedATFsS
	vjPGjIk5IG6u2u73IsztHdvrqH5fjo1hrotmZk2KWI+XEIl2+VVylh2kuvA9ko6EoJ9xZ4w/XDmje
	kt+ydO93KLQPxdgJd/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTyiv-006cqk-06;
	Thu, 10 Aug 2023 06:00:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTxZb-006WK4-1O
	for ath11k@bombadil.infradead.org;
	Thu, 10 Aug 2023 04:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=80TgkSOn3r8Pny1tEgsCx24DCuBgp5vRLONNgzfdUJE=; b=JP7sN1QH5rwXTVllsKBxT0S2mJ
	c5UuAd1eee5RSgGpaXi68kLKOD3MBpTEcNdfHxabfCNCvALz//HvP7a0utSLC1M9/tBesnWiCQ3Nt
	G0Muj1JFzdrklPHdty9M8cq/ojtUqoW2yfMctCq0fsL7JIf7/bOY8bgZD9lY2RVqOvf+es3S8+oxb
	eXKUZH2lESO6RdP2iulf3aaZPTze3REtfmShfP5GbLrOuLPFYW8bj4ivyTbTuZFhvRPJtVdC7CtJh
	Kz8pIx4jmeW70n0eXQJi3P432rqsn3NNoyfbDVjeG1ykC4FifAVmCYIosbGxMwVEQ1l3WKxLSzuIm
	W66dysrg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTxZN-006Ekh-1g
	for ath11k@lists.infradead.org;
	Thu, 10 Aug 2023 04:46:55 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37A4ctEM024311;
	Thu, 10 Aug 2023 04:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=80TgkSOn3r8Pny1tEgsCx24DCuBgp5vRLONNgzfdUJE=;
 b=dGUG1FK6QHlB1hVKPrL2nMv4sz7ugd8isqMYG4jGoLshN79e2gtM8k+z85pyTY9BhX7b
 Qie1oFqb3CssrW0vZD6UJuYrLotTLAQ38wJkkVXATp56UsWTpsuZMMYtac90qyouxVWI
 YS27ttZDBWIepDjqV+jVzzDVlXt4IfQQ3CYxS8WK4joKZ5tsWdU4J8Iui0B/bQxt7/Zk
 x6TCRg3rF8Ao6s3n+nnC4i5cZmOL5di4xEE9OPVrXEFtijqhP5CfiDE1555J925cjuUi
 M7e42CAPbBVTdo4O4y21Y74Z8vVyPmaDr8nKKCMC3tegkyEElOD435Tr3lNKKe0+N55r eQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sc1ny2upu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 04:46:28 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37A4kSqf028319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 04:46:28 GMT
Received: from [10.204.118.225] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 9 Aug
 2023 21:46:24 -0700
Message-ID: <25b778d4-81dc-506b-47f1-e9f16d49682f@quicinc.com>
Date: Thu, 10 Aug 2023 10:16:21 +0530
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
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6nDj2Hu3oNy2GWeh8iYUNTmCTdfnVwCk
X-Proofpoint-ORIG-GUID: 6nDj2Hu3oNy2GWeh8iYUNTmCTdfnVwCk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_03,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=470 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_054652_752374_0065D746 
X-CRM114-Status: GOOD (  20.46  )
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

Also it is worth to give a try with this patch here 
https://patchwork.kernel.org/project/linux-wireless/patch/20230601033840.2997-1-quic_bqiang@quicinc.com/ 
. This seems to be fixing some known interrupt issue on WCN6855. Could 
you pls give a try?

Thanks,
Manikanta

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
