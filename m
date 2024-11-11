Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9610DD3ABDA
	for <ath11k@archiver.kernel.org>; Mon, 11 Nov 2024 18:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yimHYY/B0qH4+vOuy2H4iWTSXAKkW8vbKAefeFDF22A=; b=W7yQh4uHUesart/jlfVT7iRcbf
	OeLbmud/2VZgo2+lGw/Y/uRsvQu7ZKGJ6XfI6ulXZZvp6dkablDwmxz7a0BX4W3ubSS+CuWy7VCoc
	9yz2h+Cv8qSyw25mXefMYFRwLPytUHBtJQ4yPuzxxQbstMht8E/fsqQJXOjKofE1QyH4BFZolJzWu
	NoK4iWcgEIKEPdLe0o8gFJm7lzLNWf9kJcLc1QhvJ/JczSlFNnX2Nyj0+0M6RWtVOHkj9CFvw1fOD
	rMd7x9AsEp1gGuCea1qHuE1zagMu/L9Qov9KFln7eh31WV8uQPZ+meD2DtjvoZtlW9vJpTNGuekGX
	Pd9TuGpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYrF-00000000qs2-1kAu;
	Mon, 11 Nov 2024 18:09:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAYpw-00000000qck-2ymt
	for ath11k@lists.infradead.org;
	Mon, 11 Nov 2024 18:08:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABC3qKD028001;
	Mon, 11 Nov 2024 18:08:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yimHYY/B0qH4+vOuy2H4iWTSXAKkW8vbKAefeFDF22A=; b=kg7S3JO/trtQ8Z1F
	JFkSEYwyjlHaTjyrNHsD1W7PruBqf+VLVZTMNp/mD+HHkUAzUNQOnF90F8AM01kB
	EeQ8Nt9GW3T48UOB4E7R7eyM5TyDvzetaC8egzX7PBUZS74EGH5N/AGc/YEo8qSZ
	G66UVULPkY4aYRxuHkYlqhb9MdAzzUbD8H/BjbYZD5uPUHIErLZX0uTmuQDVIW6B
	6anezZnAUkLCE80/JkXJ5GZzwCLXVowij8S4azAurG/qan0cP/P5H3kCBPiNE3UR
	Jaa3h7eD42mLxhjYA+1tgRKiqe3/bObqxjlYtJ3gVaRsUPMaEbNFH0zdu6feXhA/
	aUButQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sytsn0gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 18:08:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ABI8Nnr006497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Nov 2024 18:08:23 GMT
Received: from [10.48.243.207] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 11 Nov
 2024 10:08:23 -0800
Message-ID: <89dadaef-3a21-4c38-9fcb-ad3238e3e34b@quicinc.com>
Date: Mon, 11 Nov 2024 10:08:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] wifi: ath11k: cleanup struct ath11k_vif
To: Dmitry Antipov <dmantipov@yandex.ru>, Jeff Johnson <jjohnson@kernel.org>
CC: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20241111070152.85140-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241111070152.85140-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ocDy-wX-ScBBKj6ulPClijCsV3zCLrzo
X-Proofpoint-ORIG-GUID: ocDy-wX-ScBBKj6ulPClijCsV3zCLrzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=454 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411110146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_100828_993254_BB963A46 
X-CRM114-Status: UNSURE (   4.83  )
X-CRM114-Notice: Please train this message.
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

For future reference a multi-patch patchset is much easier to track if it has
a cover letter with a subject that describes the entire patchset.

/jeff

