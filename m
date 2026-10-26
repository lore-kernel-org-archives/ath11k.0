Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE5B606A334
	for <ath11k@archiver.kernel.org>; Mon, 26 Oct 2026 21:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NvM6nCkE;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HoIsvugY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LpZ7KsPT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=; b=NvM6nCkEuzDv60
	ZIBLSzfft2XxULlngB0ZI6jfzTpsnZLbBIEdj+DE57EJbMRyySi7xqxt9gvpdgrPBV1Nc1t2IuJas
	R/ZKRryqu+/Y1w/ggw4kUa1/rt2Bvup/YMwxvsPSuiLh22OXoJn7xmafo1rBoHc8ib8Ft3PXV4Uf1
	t6uZg5GN7b+ugbLwO28xqVQKcmQ59fcuUiqcLK1SKWvLXCd6CqiOmi3jCoY3v0ADREDXXkz9whfQd
	rXgcD5PB0DlQUZpbLpZ6dzCFnLC00oIYWjFb2WXcQ/xZWBcrHWjUGSiN1XTsQw+zvLy4/P/V86/4P
	YGVcXwQLnzOpN9vgZIcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSLH-00000003IMh-1rO9;
	Mon, 26 Oct 2026 21:34:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLSLF-00000003IL3-0nyp
	for ath11k@lists.infradead.org;
	Mon, 26 Oct 2026 21:34:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QIo33X3218647
	for <ath11k@lists.infradead.org>; Mon, 26 Oct 2026 21:34:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=; b=HoIsvugYpfR2kurM
	7moKV8A6qIoWdgk6vO62Y0XvO2l47gFJR1mF0uNBeuvfXRzORgBKfHL0XK/kqgJv
	g0zMTPxc4P3OOV32SQxh5Hw/E003SKwOWH4tii7T984lqbzRljK3qWEyL2efPXVF
	mLAo1yJWXCtMuQ6phXfb9kgT9wsuVpIH/l4KHx53iuiGH9tIivuVKCCI9WkuA5XZ
	9zmROKtzWhd1nItZuwG92blqd8o991q6HOQ1yu2dVTP71Es9+R1OSPlJTexdoHih
	UmVmpzCColCzIwREDs6C/4bq3eSk4tjNCiYrIaMAtZ2c6bX5Kdhv+AdwfnfET7jz
	ibpUHA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj3u62tcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 26 Oct 2026 21:34:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so3123716eec.1
        for <ath11k@lists.infradead.org>; Mon, 26 Oct 2026 14:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793050492; x=1793655292; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=;
        b=LpZ7KsPTPzQ9RIa//LeJohN3J/R4PpCEprRat2UP9iF1VOTbHWYZUX1DTp6tOlYwMj
         y8RhysXmfTcHJuilqacRSlDJb6uXslLD4m9NREhP5/K/XpEmmOYJXzinBqg4u1RqEj3e
         3tT970zk869Mq7gGh4Wb4hfIEd8EHbk10gm0gxuvJislhhpHjoSbWf3gjpFQDNq//3HG
         7v2WMQ0p27TXb5N1GDIC7lfqF563B6o6LucqZeAdRrFG1HlziKYp+0VAnSCKCBnfbyak
         FwdLeb8YIvZQoMZl/+QhWqvuBXMp0aMYWmkdgGbnUX5Ek6lDjjhjCJZ4TmaCkuUNdHu6
         DiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050492; x=1793655292;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AZPPtzzlblW2grqxtek7t12IpTUi7Y5NH5yRWBx6eE=;
        b=VN2yW9RWXgv6es4UuFbYVR0y6yybN/vonUxL9LcG/mBblIT8TNIQBLuyBjK/w1217Q
         B4mL9jg8kAt+70mxcRaY6+Hwb+AXPy+2ePa7M3KCRv4oCV4RoALjtI/cNMkJuFee/y3j
         1ZniGp0ycJQtf/h+4sqprMEd6859NAsqxsOrppW9TjXI7UBrdqzqHIF40iZ2E5jtwTJp
         TVJjjrcmPhPpscK1iP34fjiyrqH89mBIBUXMbFSTpRZeh1iA/Uyot/cNJi94DGlXZ5At
         GndDB8uSDrjtizO9cJdtWtXlD5eMjgzZV3VK7TAEo2oTiVtRslc3aDIce6uIGOI1rh/v
         7lKg==
X-Forwarded-Encrypted: i=1; AKwUvByG8+ms2cFlBDC1Qz2rpFNZ9dxcs+PtHYdKC+WOx6WYxyrbZB+Q9oLcPcW0wo3Kx667ImSXNcI=@lists.infradead.org
X-Gm-Message-State: AFq9FYLrnOFNoHh7z+4RFxt8uElC4RYPDb/tNAYhxSxy2Er79l5BuGvF
	WbrtZUFce64CEWvD7Zig1cH/8AM0RDCYFmse6aFhcgEJympxfvCEzCTd0zZQene2PBJ09oDag9I
	9qRlBV04dviTfQfbAZ0cli0DCGbTXW1ThqXkKuZTVW8OhOwFKr2bqel5+bq7X3GTC
X-Gm-Gg: AYBFou0mNDrddSU4G7CMhK5zGvJ9ux9LXlFKIquCH9WZA6xWaqJ+skpvBR7sQxr98SK
	mS7aRRM+zub+AEMeS7iZLilk8hKJkR/zBcZw3yaCKp7dzcEBVxsVrXhHgZh9ze9m7M4kK3f6fTB
	Pgcz7sS0Kmj8YS5XAZt3mzj8Wu6t6ylTFid/wEO03ic88RdomqOpPcZoDYA1meCdSNdAuM7zvCU
	pYRsseNcG20jruZoyDHcLHM1y+Nz95cDuFrktJB0NYTtlM5gxMbOrM8KNne6mlb4erAWMLnvWLe
	bLZOIZE3apYTl8hs1AT7AxtYUjUjxeQST/y/+8275X4jDvLzQDbn7OtaqDRN4AddCx91woH1Upe
	rrA7MRsOF5bZFL0mpJe0QTrQ7TLiF/koVJOsxNuMxLy2Kag1hXnI/Ps8S+g==
X-Received: by 2002:a05:693c:42d0:b0:35d:4185:5395 with SMTP id 5a478bee46e88-369e845b094mr12574860eec.16.1793050491933;
        Mon, 26 Oct 2026 14:34:51 -0700 (PDT)
X-Received: by 2002:a05:693c:42d0:b0:35d:4185:5395 with SMTP id 5a478bee46e88-369e845b094mr12574790eec.16.1793050491179;
        Mon, 26 Oct 2026 14:34:51 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm32084643eec.13.2026.10.26.14.34.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:34:50 -0700 (PDT)
Message-ID: <4e206a12-1796-4179-a72d-cf33f0864819@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:34:49 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Connect to the QMI server belonging
 to the device owned by this driver
To: manivannan.sadhasivam@oss.qualcomm.com,
        Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com>
 <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IY7a7w7dwqseOjDu8wXBqH8JH39WPD0j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfX/qNPIvKWTDsD
 xDSOvl12JFW1ZE5AsikksnVuORQRDYy4MsRhvcjU6Z/7FVHlZigx9XzYyIabNbNlXujJf+PBiEc
 LAqSD62BxTxXf0+JLCzZ4qsR8gZWcGAIp6q4Urr/LhFi8gitkl9okYLvMq1X3k2p8u8Hs1jyRdz
 BmV7uMbi+wXgwNX0sAV5gSAKT+HQAhjSZFBDH3Z8erNnZyjvkm/U++zs1HLE7ndkRagwRQY+fNJ
 cb9hDyuKF6UDIOA+ciiiylOgaxQk6vI+DGttQ8cnZ4GQ5N5J4GhRxz6rITTdRG1D6cHxNqF+a9l
 d1ovn8QrMSWLYhFhn0DYGk5prTkl/Q4TwJl6W2WVIIAJsiKW3YbdfraDuUTCAwqlsKtImueCOXP
 0OXmtgQMa7NsJvq6aCkN/682S3HRh3MwGKAE9dZj4ueLEkJlbyH4phr68BT4iv0w1w5imrLu/OE
 DD+wIfi+2X7kFXluOrg==
X-Proofpoint-ORIG-GUID: IY7a7w7dwqseOjDu8wXBqH8JH39WPD0j
X-Authority-Analysis: v=2.4 cv=K823jCWI c=1 sm=1 tr=0 ts=6adfc77c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=bQg6oyjaoxrshYPP:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HQsDcwHZmgEkHUxyrjcA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA4NiBTYWx0ZWRfX2AR9JNUXiQO4
 dpY5P+UehECQGLMYOYnfHeaUgsrBlACcGBGCQyldDVjaWOIxM9HS6H/G9SQZ9iYbianKmra/I4c
 rFhc/S09tssVqSWu+AfuA/JdI4gWjo0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_143453_260058_45F8B6DB 
X-CRM114-Status: GOOD (  19.87  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/22/2026 10:43 AM, Manivannan Sadhasivam via B4 Relay wrote:
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 6441927b5382..9b6108c1abdc 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c
> @@ -10,6 +10,7 @@
>  #include <linux/pci.h>
>  #include <linux/time.h>
>  #include <linux/vmalloc.h>
> +#include <net/qrtr.h>
>  
>  #include "pci.h"
>  #include "core.h"
> @@ -1491,6 +1492,13 @@ static int ath12k_pci_panic_handler(struct ath12k_base *ab)
>  	return NOTIFY_OK;
>  }
>  
> +static unsigned int ath12k_pci_get_qrtr_node_id(struct ath12k_base *ab)
> +{
> +	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
> +
> +	return qrtr_host_node_id(ab_pci->mhi_ctrl->index);
> +}
> +

note this hunk has a trivial conflict with current ath12k that landed during
the merge window since the ath12k_pci_panic_handler() that is part of the
context has been removed

>  static const struct ath12k_hif_ops ath12k_pci_hif_ops = {
>  	.start = ath12k_pci_start,
>  	.stop = ath12k_pci_stop,
...
> diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
> index 280e50a1f31d..507062068f8e 100644
> --- a/drivers/net/wireless/ath/ath12k/qmi.c
> +++ b/drivers/net/wireless/ath/ath12k/qmi.c
> @@ -9,6 +9,7 @@
>  #include "qmi.h"
>  #include "core.h"
>  #include "debug.h"
> +#include "hif.h"
>  #include <linux/of.h>
>  #include <linux/firmware.h>
>  #include <linux/of_address.h>
> @@ -3940,8 +3941,18 @@ static int ath12k_qmi_ops_new_server(struct qmi_handle *qmi_hdl,
>  	struct ath12k_qmi *qmi = container_of(qmi_hdl, struct ath12k_qmi, handle);
>  	struct ath12k_base *ab = qmi->ab;
>  	struct sockaddr_qrtr *sq = &qmi->sq;
> +	unsigned int node_id;
>  	int ret;
>  
> +	/* Identical devices advertise the same QMI services, so connect only to

note that networking code no longer uses this block comment style, so it is
preferred to have /* on a line by itself

> +	 * the QMI server on this device's node. A node id of 0 means the
> +	 * transport has not assigned a unique node id, so accept the server
> +	 * unfiltered.
> +	 */
> +	node_id = ath12k_hif_get_qrtr_node_id(ab);
> +	if (node_id && service->node != node_id)
> +		return -EINVAL;
> +
>  	sq->sq_family = AF_QIPCRTR;
>  	sq->sq_node = service->node;
>  	sq->sq_port = service->port;
> 

Since the requested merge strategy is for netdev to take the entire series:
Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>


