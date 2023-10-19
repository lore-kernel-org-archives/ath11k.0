Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6723ACDB465
	for <ath11k@archiver.kernel.org>; Thu, 19 Oct 2023 17:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyPTsNsTvolDFKwtroCBdFHS9eYQSeG64nethHAq8jI=; b=btTeP+d1nWHdc+
	EcwSeUB3gD/0s2L5QA736wGr1sgwnCsi7F7izWw2vilPpmUgv7AKi1HpqFxPHx8w56Ja42hcY8+ju
	UypYADmbCUOJoiqcixliRxyU4LYKEmP96kH7a5+yj2M0RCs11aXeLqW/a+Snw8KhkZdm+vJdn8aWc
	J3Q4keaCvY65Cqrd617EdrxBRPnbcJ4R87x8yr37iCjv22sZtvgNbCIrfQsrUcBSJL2nJ+597aJOU
	+3sKIa4d/Lz+6ZUzunCjivn0p7UIxuDpdX3rG8lMNBHMOGa2a8hfdZo8Mn6v8i790cwtbWaHKdIER
	nzR1yXbyai0HX73B5qUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWnv-000Q2w-0P;
	Thu, 19 Oct 2023 17:27:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtWnt-000Q2L-0F
	for ath11k@lists.infradead.org;
	Thu, 19 Oct 2023 17:27:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39JDfmcH010428;
	Thu, 19 Oct 2023 17:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=U9G3NTV0pybnBgmSQBaCrwWGelgPxhZ1dOfQoqMdbQk=;
 b=fgZmmRcw8C0CqwuSGs1wiH+Ywy8BWadHowE0zC1poLakHVPKT6228JL1q34JEQU3h38k
 BKyVqEwkFQNT0cOwhRCF0j4KsqxN0kcitLwHdzuu65s5nDrzUv1D0vzvoH91wX+VB18r
 L/QHvdm0kSpGf19oI5V/atAOr4F0000o65rnNwsGXBJJfcX+vKlKRxPhya/qYCwZ/1ki
 lse7161NDIRMHRgDziGfEjvxTHg3ahTEpB5GqRQBfVsSl9+2x2MuIMd10RBlISZwdlKN
 8XnPpJ2OYKuRrQAuddZzFmajkGQ5d+Akg5P8rJg6Ovbrl/Fbx0APe2H1kbmPbFsGg1Ty uQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tu49b0qdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 17:27:22 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39JHRLmR003677
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Oct 2023 17:27:21 GMT
Received: from [10.48.241.70] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Thu, 19 Oct
 2023 10:27:21 -0700
Message-ID: <a13dd4f1-4058-4559-96f4-e110f7f4e16a@quicinc.com>
Date: Thu, 19 Oct 2023 10:27:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix gtk offload status event locking
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>,
        Carl Huang
	<quic_cjhuang@quicinc.com>
References: <20231019155342.31631-1-johan+linaro@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231019155342.31631-1-johan+linaro@kernel.org>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dc76GSLz5aeiQPpj1bnMdk0McHTqslkm
X-Proofpoint-GUID: dc76GSLz5aeiQPpj1bnMdk0McHTqslkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-19_16,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=577
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310190148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_102725_116000_0FAD77F2 
X-CRM114-Status: GOOD (  10.09  )
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

On 10/19/2023 8:53 AM, Johan Hovold wrote:
> The ath11k active pdevs are protected by RCU but the gtk offload status
> event handling code calling ath11k_mac_get_arvif_by_vdev_id() was not
> marked as a read-side critical section.
> 
> Mark the code in question as an RCU read-side critical section to avoid
> any potential use-after-free issues.
> 
> Fixes: a16d9b50cfba ("ath11k: support GTK rekey offload")
> Cc: stable@vger.kernel.org      # 5.18
> Cc: Carl Huang <quic_cjhuang@quicinc.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
