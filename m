Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215E6C3DA7A
	for <ath11k@archiver.kernel.org>; Mon,  2 Jan 2023 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q+ZRqodFGg77f130VPCSeGFYf0aiE/iggu1mxMHzKis=; b=nAVv2sPQI9mk5K
	XwtTd0KpuCaJRnyO4PoHm+3pf6BxCM4LIZ6qZTvFQkm077DbnxYMJieG5ywjCbZPQxNHkm4OR/DyF
	fU+v4kylNTTd1G0lkMhOAdKUqSqHYTZCt4qccGAuuBmN9z1Lp+cQGlgXkrwLZ1OqnSm5I4Z5mPA15
	fPTRXccf7OFeIb7XKfTEhfxgt3HjUYQjX7iyhGzMavqcZCT9JvTBatZ/JgqB0xItdk3lLMFRR+RAp
	zEC8ccg4G3vUg6NWL7TNXg171o++xXanCe8TfE0oY2FAPRl2tz27IWWcIygpJQ5Rs5d+y8yRQXhLp
	4qtl/8GMiXTkCQX+O8Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHva-00AJTs-Cm; Mon, 02 Jan 2023 10:20:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCHuZ-00AJ9s-5E
	for ath11k@lists.infradead.org; Mon, 02 Jan 2023 10:19:23 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3029s7Ek008222;
	Mon, 2 Jan 2023 10:19:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+Zv5sOl8YOABCxjez9S3ZDFv5g9h+/4swq5f0U6JbLY=;
 b=h0rZiabgykFRhN+ZZhXZIc/tacAbwSH/dKaJHrEai3YWE4v8Btnkzh/KVaU4k05UvEYV
 d7Fkb4gpcmkvMCkvknxiAhoxzejxHNzvLIUI9oreKjW15+Hq1xnZSl3URWWmRfLdp5VK
 vr4E+MPUFLPujQRRsCjOUXL30RAJqSi9hYE+Qww24evt1MrvWHMAJzACr0Wb3vS306XJ
 KVURz7pudnYkMaupo/DtBdY5ruVJjW12Swa/M27VD0kC2Dq4E59Ih3IG5lfW8auU8W1E
 FiECEoceod+s4U3woq4U81q8AQiOMQJpwC4UZrii+AwMoZ+neOLsSNyOmqyyg9dz5g/Z aw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mtc3ejwtg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Jan 2023 10:19:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 302AJDpw013367
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Jan 2023 10:19:13 GMT
Received: from [10.216.48.166] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 2 Jan 2023
 02:19:11 -0800
Message-ID: <e11e4312-d373-ba54-6d48-a9c471f78532@quicinc.com>
Date: Mon, 2 Jan 2023 15:49:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] wifi: ath11k: Set ext passive scan flag to adjust passive
 scan start time
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20221222131720.11368-1-quic_tamizhr@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20221222131720.11368-1-quic_tamizhr@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XVoUoYgKhPX6OaX72H58ZfiYe7_DAjuZ
X-Proofpoint-ORIG-GUID: XVoUoYgKhPX6OaX72H58ZfiYe7_DAjuZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-02_06,2022-12-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301020093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_021919_443479_47DEB671 
X-CRM114-Status: GOOD (  11.40  )
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



On 12/22/2022 6:47 PM, Tamizh Chelvam Raja wrote:
> Set the WMI_SCAN_FLAG_EXT_PASSIVE_SCAN_START_TIME_ENHANCE flag
> while sending the scan command.  If this flag is enabled when the
> incoming scan request comes with a strict start time and its duration
> overlaps with next TBTT, then target adjust the start time accordingly
> for passive scan. Target supporting this feature will advertise
> WMI_TLV_SERVICE_PASSIVE_SCAN_START_TIME_ENHANCE.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01467-QCAHKSWPL_SILICONZ-1
> 

If this change fixes any user visible issue, better to include that details.

Other than that, the patch looks good to me.

Vasanth

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
