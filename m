Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D353CDB482
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 15:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:CC:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PmL/zLxHGFDhnEclOs4Lbmi6H03QUIW9qftYGULJaC0=; b=G8t4sgScLJgchO
	QpimDpeLwVLM891p7eSFybU1k/IYF08zshoYwTV2kSmmGtu4VIFWj4HMmJtSoFg+yGqOz6HshrgHZ
	favvOx5czmoAgbu7kwJKqAsUIJkJ6RjGrJmqUYJmOgE02ln3MtiBdno+D+JUZyF749gy5+5xX0Fv3
	dYP8/UYnU02TKm8nKbfT4fb3EP9QJOslGDlpXI90dS3VJHc6jGqMEsPuDKkkQan0qzEzLdpsTt/QU
	zHwC/Kduv6qbHHdk7+Oyrcoomm22lMC6nBd/9ECW8fOTceoMhRh/wLKJlvNqIE2PWKzFDI8FcU4JK
	92CtXLVh4R3BMMta3oIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUcS-000AEZ-1h;
	Thu, 19 Oct 2023 15:07:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtUcP-000AE5-2j
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 15:07:27 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JDfXx1014951;
	Thu, 19 Oct 2023 15:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=YEWprmYpoYPHIElmYMgnPZvVKsSszYHwSAF+toFkvg4=;
 b=bU/bhre1DWeo5CPdRE7GmcnokkbyN/bw27AGLUfBE/5tsWnr8mhxgzHvRXEQWNN0ryAa
 aVtXW9AxNd0nWZ2cvvQINjQkATmMTt+/u8uzFrHIRY7HFgvyVLyDOmRsdvatKIpUzL+B
 AbiLqA8PHyGeFN/M85tOlZNqrtINE0VuAIJwFLnWBiqkEtW8PNA9rX5hSdTPtv1aRpby
 2LWJzSJwuxeUya6aBH37/BsMlR8irxBTHGUXgv1PTGVrfUosmL+LrVd50lJz59AU4TrA
 /nKcB4No3OJZ5kcRDsenMqYO0wPeWuKmFXVqjINKLLx27CdGm5ElCDbxdy3X0pJ9Bn75 Fg== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tu3pj0d20-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:07:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JF7LJE031825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 15:07:21 GMT
Received: from [10.48.241.70] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 08:07:21 -0700
Message-ID: <5581120f-a3df-46c6-ab02-02e97f85d94d@quicinc.com>
Date: Thu, 19 Oct 2023 08:07:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath11k: fix temperature event locking
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
References: <20231019104211.13769-1-johan+linaro@kernel.org>
 <20231019104211.13769-2-johan+linaro@kernel.org>
 <4233c8af-5911-40bf-b5ba-dd0a63863a45@quicinc.com>
In-Reply-To: <4233c8af-5911-40bf-b5ba-dd0a63863a45@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NbSrSioYAYZiZfrAbTSB-2m-lbm-dqCj
X-Proofpoint-ORIG-GUID: NbSrSioYAYZiZfrAbTSB-2m-lbm-dqCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_14,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=597 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_080725_910082_4DC20DC5 
X-CRM114-Status: UNSURE (   8.74  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 10/19/2023 8:04 AM, Jeff Johnson wrote:
> perhaps have a goto cleanup that does both the unlock() and the kfree()?

or goto exit to be consistent with others, including the DFS radar event


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
