Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D13C001DD
	for <ath11k@archiver.kernel.org>; Fri, 14 Jul 2023 01:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmgOGkvF/4RwD/uA99kVcS9Fv9FDhhl7IaxX00z0vHQ=; b=QOHaZH54ln1VX3
	1YZjC4MgtcAmfDLeAxQ13D1rfIEHqhP3f+oqwq2V4dHhnGYqW6ieE7C2B99Ia02o+U+138YZQq7XV
	UKx7PlJeT91h/ot9IELWgnKA7V0aI5qOByjkDpehf4b3eMev/YxmYN6Xvk3x/rqwOc0ujiRefwfTJ
	gYA3i0Mv4j/JILv+L6NZCoPymBc9OK977itw3mB3i8/R8gNINbUdp5kJ/fhVOsvTxRa/7u4IlBmCm
	NqSbNxjjSdTLuZibhNYguIPKEziDgEb0GwlfN68MBp94aUPljR0P3CWcPR3bOJXMPJmRY16jhgc7m
	FKT+NWNlWXW6zEkvpamA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qK7dr-004hnm-1a;
	Fri, 14 Jul 2023 01:30:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qK7dn-004hml-2r
	for ath11k@lists.infradead.org;
	Fri, 14 Jul 2023 01:30:41 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36E1JQ5d009251;
	Fri, 14 Jul 2023 01:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=iIYd+ndnBP9Et0RdX1MT727gSCrDVeXp4gIeVGs58Xo=;
 b=Bn837O5NuhmHE4Z7uzcSiFILDjnM239SjcdIG7ZjO9JcP25UZn+GAU3sXYNlxS8tA8cM
 pgU2aPzQ4zn2KSOUD0KedJTgBCxdTG1gh2IH/okgl6O8yxsuGM0tdYVNP4Ucz9oA8OHb
 BH8KaK2XjwsEmAFap0SjwtqRysJiEE32+fUO31r+EjDANG5H/1Tm93dH6mGyTefCsU03
 RNWbpJitLIvQCLPFOIQk6a9rInGjH4iX9D0nO0IQwjcNV7W/HBQCB3EHEa1lLWKK2O9l
 lsvd9smMeDbeMjB9ktWD+/uOUyCJi6xGYyKtyNXSOINrN+DcG76twxsjaptNkbt4lpsS 4A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rtptu8kcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 01:30:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36E1UT7C026872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 01:30:29 GMT
Received: from [10.111.182.44] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 13 Jul
 2023 18:30:29 -0700
Message-ID: <c88f4ea8-34ca-8544-3b74-4641557da9ba@quicinc.com>
Date: Thu, 13 Jul 2023 18:30:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [v4] wifi: ath11k: Add crash logging
Content-Language: en-US
To: Arowa Suliman <arowa@chromium.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230714001126.463127-1-arowa@chromium.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230714001126.463127-1-arowa@chromium.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Y9nnnd2rj8rolU2ha7XreZeiABh70oYe
X-Proofpoint-ORIG-GUID: Y9nnnd2rj8rolU2ha7XreZeiABh70oYe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-13_12,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_183039_934738_0DE648B5 
X-CRM114-Status: GOOD (  11.49  )
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

On 7/13/2023 5:10 PM, Arowa Suliman wrote:
> Currently, the ath11k driver does not print a crash signature when a
> crash happens. Checked by triggering a simulated crash using the command
> [1] and checking dmesg for logs.
> 
> [1] echo assert > /sys/kernel/debug/ath11k/../simulate_fw_crash
> 
> Change the crash logging from debug to informational and add a warning
> when firmware crash MHI_CB_EE_RDDM happens.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.23
> 
> Signed-off-by: Arowa Suliman <arowa@chromium.org>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
