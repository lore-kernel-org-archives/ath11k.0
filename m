Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F2CC0015E
	for <ath11k@archiver.kernel.org>; Thu, 27 Jul 2023 12:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcsD+ddk+UvE0GAYg/aJXUXJj0NpOWqVFZOPCoVPX+c=; b=1c723C3yMEU8Yj
	1ephD5onMXiqRw9hDaXNacXKD74H5R9FlMT7sO/nQou/RgYmvkZNA0GLWPMjChEsgBglzkfPftX5s
	jqvxCiaS1BrNxleXT8AZRw4TAP6+PZr/cAM80vWQMmlfmuBsOVKpAnwxwVI//L00r5JkWvjPRQIZi
	V5reOd7I5CgaPrxMSh5XHX8Tzrki/tRGpy8+4fdvN5VfTfxazhaIlqKbzU00mzvheDIDjg9+vYEpY
	h5bay+jHQSeVPaPSkSfqAFORX/69p5wMYQLT7SLBXwauGGv+vfqFgzuEhXKJVAWsCLPe02898xgJ6
	3RLUFewgmnpfqt+mZ5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOzkR-00Dh2s-1I;
	Thu, 27 Jul 2023 12:05:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOzkN-00DgzY-2O
	for ath11k@lists.infradead.org;
	Thu, 27 Jul 2023 12:05:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36RBRheG019561;
	Thu, 27 Jul 2023 12:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6j3u/oOQ2us5i2A4s9YNCLmj+cjL8lOcyodVJizc/wY=;
 b=VSb6HouaU3EfdrEs6h/Dnx/dDvzwDcPGHBs1r/UndsqoI28jRXbgEr6SyOdnWYwHWiTF
 pvQlWzykD3YttCBoBtKSrFQZpL1TZSHAESNt5TqOO1TtcRAahJ2xq2DyMInws06TfD3L
 NNQraOKtg/Zdv5NKIC3DgHSVz0ERuqZRbjq1WAMmRbemn6VLfEjL+nffcnU92GGi7MFB
 Vlw2/4VaB5InHzylmq4VmZsowTVM2oOTcy6dZm7TQnkvLeOahGiyT9BNOz22cBGSHmnf
 MSoV90qaZcN91UVDuuz6JAcklLFH7uMpANEi310PGY2ijs7/IZGlpkLpLgnCxUh10Kuu 7w== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s37g0hy6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 12:05:34 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36RC5WF5005127
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jul 2023 12:05:32 GMT
Received: from [10.201.207.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 05:05:31 -0700
Message-ID: <5e45705e-b1d1-a0dc-2c3d-455fb433e93f@quicinc.com>
Date: Thu, 27 Jul 2023 17:35:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/3] wifi: cfg80211: export DFS CAC time and usable state
 helper functions
Content-Language: en-US
To: <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <johannes@sipsolutions.net>
References: <20230607124647.27682-1-quic_adisi@quicinc.com>
 <20230607124647.27682-2-quic_adisi@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <20230607124647.27682-2-quic_adisi@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4UyHquGEFdcdlGMlm1NRtev2jbbZoon7
X-Proofpoint-ORIG-GUID: 4UyHquGEFdcdlGMlm1NRtev2jbbZoon7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_06,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 mlxlogscore=719 phishscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_050535_898977_EC7BC448 
X-CRM114-Status: GOOD (  13.57  )
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

On 6/7/2023 18:16, Aditya Kumar Singh wrote:
> cfg80211 has cfg80211_chandef_dfs_usable() function to know whether
> at least one channel in the chandef is in usable state or not. Also,
> cfg80211_chandef_dfs_cac_time() function is there which tells the CAC
> time required for the given chandef.
> 
> Make these two functions visible to drivers by exporting their symbol
> to global list of kernel symbols.
> 
> Lower level drivers can make use of these two functions to be aware
> if CAC is required on the given chandef and for how long. For example
> drivers which maintains the CAC state internally can make use of these.
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> ---
Hi Johannes,

Do you have any comments for this patch?

- Aditya


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
