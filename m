Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D93C04FEE
	for <ath11k@archiver.kernel.org>; Wed, 20 Sep 2023 19:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rrRoXAUlHtzeSkf2hnzA/JehihUsdxcEu4t/VeFmfHQ=; b=18eNAQVYaX0Jxg
	E4dJn/0GLycnyou027X2eSqbZmAjeihf0tDx8kf5RPSeto3x1JBnvu3bTi+VoVhCGgIBghTOBwoFa
	HTV8qAqxToRH5ZV+7780MsB6Lw9N88QVaszIbfonXgYQn7XfGNGgsemIbm7cR++VEQLEC2ou2o0kk
	nR+AD9riw+QfrlNWo8Qz2hUt1ceffkJyYMdSpudmI2sgomePExItYFiE9bAB52/V7ljshlLmlvPqH
	7XdCITEhm1BPqg4GZdhxgnODVxHvG1e9I3XwCNtsmOrOITmf2xKx2JhBfEhfMN230ZtFSbuqtlFrs
	n1g6DenJKFkB0gO7s05Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qj2rJ-003ztN-2f;
	Wed, 20 Sep 2023 19:27:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qj2rH-003zsp-09
	for ath11k@lists.infradead.org;
	Wed, 20 Sep 2023 19:27:36 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38KIFGWD029165;
	Wed, 20 Sep 2023 19:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=ozA0Jujf7fT06Boim5upfAurdk6RBRhq81ypAGzT8yI=;
 b=Bt4wVXadjZz7EOm/+tOr2NZw3OwEj6LgHVS4cj9ZUuWIQJVsPTY3wUY8GEl6tJDn3PO5
 UrSpYcF4HtsbzdUefbaT/jKz35EK6OpT5t4GP9Euk8s/Lnm9LnDmYiL8GpxKpqJ8i5i3
 gM23p6j/eHFIj3VjO2ukuka0adYZInp8GSwXmWgaDY0DHGbPsgs35Bw5oGfg8jfhCUb/
 slgiodx51AW9sD6BmBHKkqJ37dujtzOzasxmHKobXHMup8sgA0MBJCAL+WuyOuvwZKkr
 ZNMYLhAEUuXd1DfbuPnI8I6U4/zRan6UTOBh18i3U8IyX49xMyypaMSLRF0MsgFC8Mtv rA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t7r8w22c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 19:27:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38KJRTQw021933
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 19:27:29 GMT
Received: from [10.48.245.144] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Wed, 20 Sep
 2023 12:27:29 -0700
Message-ID: <ae6b0ae9-d9ce-4028-ad39-ed852e117a11@quicinc.com>
Date: Wed, 20 Sep 2023 12:27:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: consistently use kstrtoul_from_user()
Content-Language: en-US
To: Dmitry Antipov <dmantipov@yandex.ru>
CC: Kalle Valo <kvalo@kernel.org>, <ath11k@lists.infradead.org>,
        <linux-wireless@vger.kernel.org>
References: <20230920115447.38355-1-dmantipov@yandex.ru>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230920115447.38355-1-dmantipov@yandex.ru>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8fFreZr-cybcIphCwU534yGTEZAseTEU
X-Proofpoint-ORIG-GUID: 8fFreZr-cybcIphCwU534yGTEZAseTEU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_09,2023-09-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 mlxlogscore=383 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309200161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_122735_217694_C678DB1D 
X-CRM114-Status: UNSURE (   9.70  )
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

On 9/20/2023 4:54 AM, Dmitry Antipov wrote:
> Use 'kstrtoul_from_user()' in 'ath11k_write_file_spectral_count()'
> and 'ath11k_write_file_spectral_bins()' and so simplify both ones.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
