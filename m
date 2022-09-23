Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06CFC6FA8B
	for <ath11k@archiver.kernel.org>; Fri, 23 Sep 2022 03:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65m/EWXnWyOEcQBk2+7YS9JsYatPMUkEbJby626WYXM=; b=W4k5CPIgD+89JL
	ikTGf+/EimxlYFN4+H20ZHt1/NX64ZMUEoKLo64icepwYZVFLyifxHdUTWrn5DXtR44D1mzw7z/3n
	w8n00am0eYcE0Adrf2tQrZiGz2lbkfRvPsx2LQVB+E6W3PQqW4rL6qgRFKB+riItSvkWvrj/Kot+0
	O54aGONMHGut0c+sxryQCfQLvbiKAL+ZGSdyTRBnbB7nN0B+dCceBz9W/mOmMIAFWuWjRdC/3jeOM
	84yDjCOrnJ2K1aJdx5hP5gOvBPVyEIuGx3saJWX0Lygx1ndcLywHGjYhJvpEs8y6cya7dZOaXBRjg
	KpUDPsZz+6LyXBs5HD2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obZg5-001ou9-DC; Fri, 23 Sep 2022 03:48:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obYYn-001a8J-Na
	for ath11k@lists.infradead.org; Fri, 23 Sep 2022 02:37:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N1oqwe029985;
	Fri, 23 Sep 2022 02:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=miMAe3rC2PYLPdw5GZAzlGYiscSKTdhuRQwxsQjpBzI=;
 b=FBMGyQjT2rd6KbqhLaDR2x/TpkJiOx0FSbFzl8PBRQx+MLsDQiMwR/MtsxLeSAUuDMEl
 KdDEXsvoAI3uKo8pMuL/y4hCxTCpPTYnGmwg+p/L7TpzXn9UJoXbbxMFgs86JnTkyote
 XCjA4BE6OeSYP0mMlAeqlXoDsFS2lklyrHb2QqusYw38qK8XdD7r7yXbJRlGXy5VFNX8
 uVYoPj+jbV8xbGDr7XzoyxesfOrF/KVQJVDdN0HWYlSN+NVYnOR5txUYaspuvrczBoH9
 K8+5tlnQolRU3EsNDLB7p3dJXth9yJSxct7VPM4blZjBjBFq7haNP/czEMcnBafDNjax dg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jrutp97y5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 02:36:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28N2anxD023379
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 02:36:49 GMT
Received: from [10.231.195.37] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Thu, 22 Sep
 2022 19:36:48 -0700
Message-ID: <23f64039-6f6a-7912-8e92-b45c86b4875b@quicinc.com>
Date: Fri, 23 Sep 2022 10:36:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] wifi: ath11k: reduce the timeout value back for hw scan
 from 10 seconds to 1 second
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20220919024121.24820-1-quic_wgong@quicinc.com>
 <166383445202.9473.8707216192194973891.kvalo@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <166383445202.9473.8707216192194973891.kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fF6e17EMG7frIDK5PNXLcuc-hGnyQTzz
X-Proofpoint-ORIG-GUID: fF6e17EMG7frIDK5PNXLcuc-hGnyQTzz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-23_01,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=579
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_193701_832506_0C2E939B 
X-CRM114-Status: UNSURE (   9.87  )
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

On 9/22/2022 4:14 PM, Kalle Valo wrote:
> Wen Gong <quic_wgong@quicinc.com> wrote:
>
...
> With this patch I started seeing new errors:
>
> [ 1194.815104] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> [ 1196.864157] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
> [ 1198.911926] ath11k_pci 0000:06:00.0: failed to start hw scan: -110
>
> This seems to happen after my suspend tests, but didn't have time to
> investigate further.

Thanks Kalle.

I guess it is caused by 11d scan is running at that moment, I will 
provide v2 for it to avoid the "failed to start hw scan: -110".


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
