Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18DCC4167B
	for <ath11k@archiver.kernel.org>; Mon, 27 Nov 2023 16:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3XaRcrVb/4Ts5hi801Epe2WPLEQCT4bowz639ed80E=; b=uj+pVL7f6XsRGy
	a2oHVO8t4AubPZM14oMT5duoYOFGsx7X3n66+3dmC2d1LoKdkkG+Px6KOvC7ml8OxMVPSx9XHjVT6
	87Syx6W4PHFexajDEhHv4fA4JX0pr6hKVb2yC2QKDo77P6bfLv/e1yAHKHIuE22eP91AruA0quROw
	wuH+INv9/6Oyja0XTFGEcyOXSxeZ7Vj7hhOUva3trVPvX8zlHYSgkdaRPMCo3m/6526q8XA5vRcdu
	I9GxmL9ADrcyuprEv8x1L86FWh79+v+1Fqf7kr96jNxJ26FHuUTxLbk9Y9/ibaZp6oN/qu6NR+D3Q
	r+mfU6XI/hezm6V0VbIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eXm-0030Kk-20;
	Mon, 27 Nov 2023 16:33:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7eXj-0030Jo-1W;
	Mon, 27 Nov 2023 16:33:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ARD9P3X020717;
	Mon, 27 Nov 2023 16:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=QLA/171HhAOE/egCjy+Rmr5mzz8RCpW9xnlC5Re56ko=;
 b=czaiz0QHPHMLIgofj03Opd1tPrG07Wcb2I+E/cHXMgTeTrzraZ83raTFMaLcCRtTT0ZB
 SIUsik8Sf3yfSwK4D4/rA9Oceg5SgK33xsWV2vvwfc8qSrQ46JlQcfPb4nhF7j18GIb/
 FBxexQ5a0hCK/b+bNXNgqTCFOL1FnwY5tHaTPaqeqwIUkvujt9MKO7CacGJbSndGbkiH
 H4esM93yfW4FmxDrcOab5Tam9xXMsMwfrEyE35HqXuxJULVepnBg2JmYl0hD0tQ1+hih
 J/kqo+zn16jticgzddTjePhY0cRmJwnuR5WzFDRS+NTIM2m76SmrnvzMAZscmy+qch24 Vw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3umsvagvxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:32:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ARGWrSE026568
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Nov 2023 16:32:53 GMT
Received: from [10.110.63.243] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 27 Nov
 2023 08:32:52 -0800
Message-ID: <c5555ad6-6991-4fca-864f-355d2fae9ae1@quicinc.com>
Date: Mon, 27 Nov 2023 08:32:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wifi: ath11k: Use DECLARE_FLEX_ARRAY() for
 ath11k_htc_record
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Kalle Valo
	<kvalo@kernel.org>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook
	<keescook@chromium.org>, <ath10k@lists.infradead.org>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20231127-flexarray-htc_record-v1-0-6be1f36126fd@quicinc.com>
 <20231127-flexarray-htc_record-v1-4-6be1f36126fd@quicinc.com>
 <4f2a486c-c6de-43e4-8bb6-bdd3f819b0a9@embeddedor.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <4f2a486c-c6de-43e4-8bb6-bdd3f819b0a9@embeddedor.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NBTLP5sNQY8IOwWyfKdHtu993kgLMr8X
X-Proofpoint-GUID: NBTLP5sNQY8IOwWyfKdHtu993kgLMr8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-27_15,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxlogscore=571 phishscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311270113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_083307_508106_D119E18F 
X-CRM114-Status: GOOD (  15.47  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 11/27/2023 8:23 AM, Gustavo A. R. Silva wrote:
> 
> 
> On 11/27/23 10:14, Jeff Johnson wrote:
>> Transform the zero-length array in ath11k_htc_record into a proper
>> flexible array via the DECLARE_FLEX_ARRAY() macro. This helps with
>> ongoing efforts to globally enable -Warray-bounds.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/htc.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/htc.h b/drivers/net/wireless/ath/ath11k/htc.h
>> index 84971cc9251c..e0434b29df70 100644
>> --- a/drivers/net/wireless/ath/ath11k/htc.h
>> +++ b/drivers/net/wireless/ath/ath11k/htc.h
>> @@ -151,7 +151,7 @@ struct ath11k_htc_credit_report {
>>   struct ath11k_htc_record {
>>   	struct ath11k_htc_record_hdr hdr;
>>   	union {
>> -		struct ath11k_htc_credit_report credit_report[0];
>> +		DECLARE_FLEX_ARRAY(struct ath11k_htc_credit_report, credit_report);
>>   	};
> 
> Why not removing the `union` and just do a direct transformation [0] -> [ ] ?

No reason other than staying consistent with ath10k.
Will see if Kalle has an opinion on this.

/jeff

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
