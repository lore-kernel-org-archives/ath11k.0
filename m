Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD08BC04FF1
	for <ath11k@archiver.kernel.org>; Wed, 20 Sep 2023 19:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v3GG7+zNWpkrlQk5/49v6uMqHD64vD5cW0LZJAEHdvo=; b=r8msmHLLwE1YKU
	92tFMDPRFOAvwzRujR77A8y6seDxGWvANa/+2P9EW82Qlcklhj7XavJaLvtkeHRMYXExlVvYyZcKr
	FOxNbBOR6wgS4Yg2pSospytYhOzvlKWxHs7Dy0Pa9pTmnD09Idl8dXCbTQepYo8hF7KGzpiRUhBel
	UQOGBVcm0fhX7T2+hyRC5jZ4jpW5KRiToGUScLsaKvPur9JTthpyAn9+mJ/3M2yuSk6hqqTpUg/Th
	Q6eTTAshdiU6v5vIdgNMVqwWkZ0s8862vYDXbj9sd7Fp0I4tAMTMCjLvB5uazB4xTLReXIXxyJlCM
	wKwBaDRFvT9wLBZK5wFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj2tV-004149-17;
	Wed, 20 Sep 2023 19:29:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj2tN-0040x0-29
	for ath11k@lists.infradead.org;
	Wed, 20 Sep 2023 19:29:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KJOsab031106;
	Wed, 20 Sep 2023 19:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=f9M2cPom+8uzIHRKEFk/J7faMo4xsq8DtVTD+om7VMw=;
 b=Zl+3OEBi73ct+/2c+QwcHcaixTS4klPhGJjhkH87k8pVAJWI9xtX3977xVpH5Mn1uMIS
 vc14a/phGyPTNSJ2JCdF0HRsP7GODaUc9CCnk5fHYPqiqpmfTNtqXpX3n9VsMCaEjHto
 DhPVmdArgchTFFYgkxf2MNgTh4tjFzeY3hN5y8Lb3Ip/6DsagJePOM8pHqAFZRhd/EZ1
 efNP0RwB5jgDpUiTLsmaVpffljIRasrSGzE5rgbzggxj51T7FBfDRK0a5EGUEz0ArcM3
 WawOlYa1TpD9FQqcCaqda0TJ1k7vmPBecsyXtmoWnqpOySGdgLXxttjv9hut2z8scQyN 7Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7qujj376-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 19:29:41 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KJTeSF024325
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 19:29:40 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 12:29:40 -0700
Message-ID: <47c0e19e-5f79-4b91-8110-9df835434cfd@quicinc.com>
Date: Wed, 20 Sep 2023 12:29:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 wireless-next 8/9] wifi: ath11k: remove unnecessary
 (void*) conversions
Content-Language: en-US
To: Wu Yunchuan <yunchuan@nfschina.com>, <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
References: <20230919045150.524304-1-yunchuan@nfschina.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230919045150.524304-1-yunchuan@nfschina.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vCCQPVBNwDbx0ZSqzURi7wLIjz9qGuIt
X-Proofpoint-ORIG-GUID: vCCQPVBNwDbx0ZSqzURi7wLIjz9qGuIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_09,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=668
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_122945_841661_13C17BF3 
X-CRM114-Status: UNSURE (   9.66  )
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

On 9/18/2023 9:51 PM, Wu Yunchuan wrote:
> No need cast (void *) to (struct ath11k_base *),
> struct hal_rx_msdu_link *), (struct ath11k_buffer_addr *) or
> other types.
> 
> Signed-off-by: Wu Yunchuan <yunchuan@nfschina.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
