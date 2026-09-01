Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC434C61DD3
	for <ath11k@archiver.kernel.org>; Tue,  1 Sep 2026 12:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=; b=fBHIvOSy7pwd1pylH9a7KuH2yq
	do6NZLxuLI3PhAToxpXjcWYyXaY/CgEa39EgSy2c+HNGse8iZxBnlhabeoFgvxLrbo+iQQr7wzjN9
	IhpJH2qB7NdRHVCySWVnZGqKc+nmbO4IRp5Rh9u0jmLSXHjE8hnJr+P3DyhsVyepytkxsnrU8AJg2
	NrdowovP42TIw9ZYdFGasMYjREqR50o6AAVbx5XCQG+LYf/RLvemmpCOnxZbK5LK42mpEe4N+9tZ0
	wz+bMMHJmmqal9SVaEQW5+CCR1HSWodiMC/6NOhR4nLKSiPSkZILRJ0WvrPsC4kB5ak5Fx64TO8NB
	n09uzbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NgN-0000000C7IW-2ZIa;
	Tue, 01 Sep 2026 12:33:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1NgL-0000000C7H9-0sJC
	for ath11k@lists.infradead.org;
	Tue, 01 Sep 2026 12:33:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJO312993708
	for <ath11k@lists.infradead.org>; Tue, 1 Sep 2026 12:33:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hMw1bZsyl/wsw6eXPmwKbIq6
	QdTazM6/t3F4X+WUBco=; b=eWjZsGYAZj8O5JUmFfCnYfRbww3oq3NlVlYWZXS1
	cqUsAhlg3HoZjGzoS4YlzLMgF1qH2BofiuocRfwAFFr3Y89bl5dAgkfB9TEwQAlg
	Yfykf0OjnTmoOKrma0qRTi6uKbpqgHIeeT6QcbN3bKXM/IbnA46+RaZSGloloi5s
	kwl/tWFfr3cHUXJ2CgyXJEU7fM/+8KmWY2LJrjaUvJ8fs3l+LKcjcMSVTQTJQleL
	63qY5ZqmFHMuDZFEU3nOSQvkU+whOZ0Zc9y4DoJvn8CbQj20Gs2J+0pGlPG7heoT
	cQIrBuS0MhrVaGhwS3xy+kwceHv0oAitHo8EpaPNr/9sNg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3cct9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 01 Sep 2026 12:33:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8472ee1eso40359176d6.0
        for <ath11k@lists.infradead.org>; Tue, 01 Sep 2026 05:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788266019; x=1788870819; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=;
        b=ShcPpkxOZ+tXB6doqYDMOZf0O240v4+XnQb53/KTxjLjnTEuTU+Y1L0JLuUFRns3Xb
         hzCeLkA4moW0rnYwQquzkFuHiK0Cn1Ajga8BkBbNWaPon079WXIkS5B0rVm7f+f4mNn1
         H/n5Fhd6TSxCHws5HAe8dQEgOO93whFxnuvlgIRIx6IM4iEn7qZVuuk9H7Ws3v3sFl5+
         nGUNjM2QSVT360hn7hsiyVgzb2ElqVuH+7/clPeFFk2/zuGN60KrcOwnDUoKkj9NDJca
         m8jcglB6nYC3zEBLcuQdCGbvTbHXHswBdF02CeWtJLiTIt+qrW5t4sE8KLWjmEIfPLfy
         ISkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266019; x=1788870819;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMw1bZsyl/wsw6eXPmwKbIq6QdTazM6/t3F4X+WUBco=;
        b=XRtseXTPwT/lQYo2VCvnaxchh0yOsXVWaFKTbCeGW0FEnBjw2uNbpaLph6eFqbosUG
         nBTTKXkmIEQe9zAlHuVO2N4oqW/oKWuSWdR9CllUvLqXNh6k+UN8qxp2qfWuoSbhyINs
         B1mMFJlWP4g6oBVE6u6E2XnN3maHwc7IC9WMqmnZRgqZ6XceO26gkGyvXW+QQIBs1Wy8
         kFLYjO2/lQHb1U5PmCEByvCz9rcs+5s1HYAOyrtlWY844FPuhADDFU6SruxOZI3pZZ8Y
         Hubtw4DTsXR88MujlELUGV6cM0JzkaSco3LXokfK2g4gU6dg3mBoxmIQtYOUjflwE+hR
         OmTw==
X-Forwarded-Encrypted: i=1; AKwUvBxCatRkTIeVwAbV8woKc2J/pMK1P/GPfOCX6Dizf9MeLA/xJjEQspFUYQCvhYNnfmixHevU5JI=@lists.infradead.org
X-Gm-Message-State: AFuF++mZyc0KzQ/QaR8seheuBcGupJqBHfDoeX/BgAaV0oxZ39g+4iVu
	YYEGiOWmUXi6edzIQFc47W1VY/64m8mXT81O80cJdQMoRut1kG8CDjegN70urV4nHhSOb3VK4mR
	l4YbHbNTAOqOkWFG0Gv4u3aXVrpUvrHI73ty67id7gFyni7A0U4FB6rMdpMV/Dm4P
X-Gm-Gg: AYBFou1jxWl6LgMak7sZzSmYGG17p7v2Ls9g1UihUIAInrQ9YyaC6zEsWdN6hEA/iq6
	DdxemGKyCJhu/iK4LnQDCD8HKyrwzk3luq6vEv4CxIxxWyXLAZzg+dfmmf8Th6puYnpmNohViNx
	2pckSdaGXtYwcFSaSijuz5q28VVBTb+pkIlkUGHRwoV+rXYrGr2LBcISIBtSsasr4igpWUAQ8pP
	o9gMxEvYEiwnhPCJdn2Q86fwvAxSB+fK++jdlJsoPM8fIC0COyJX3Ty4CuEAS5vSNJ9mksCEK3O
	UnXvWAcge43qhSr0mfPAyxtrm/l0t75Z7KwCf96tqrn9vXz3+Ys9zKE6zt4fE0db3bEzqMTBI0H
	6l5A68gZ//GAYSfU0v2qjvVofjdds5/iNMsau73TdmC28sg3kDlvmUCSF5hcCiCpuX0yWK8+zCe
	6JxhXys5Yv4Mg2
X-Received: by 2002:a05:6214:4908:b0:90e:976d:fd2e with SMTP id 6a1803df08f44-90e976dfd5emr49205786d6.13.1788266018598;
        Tue, 01 Sep 2026 05:33:38 -0700 (PDT)
X-Received: by 2002:a05:6214:4908:b0:90e:976d:fd2e with SMTP id 6a1803df08f44-90e976dfd5emr49204746d6.13.1788266018042;
        Tue, 01 Sep 2026 05:33:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31e5fc6f7sm16578891fa.16.2026.09.01.05.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:33:36 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:33:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware
 ath-20260831
Message-ID: <lh3sniuz6oxovkjdhdrjmjmoczjx5y5gnxfv3lteq3tpmjvwpr@x2n7qbbeqnnk>
References: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1b69517-a18c-49ba-8ef3-9b5de089eba5@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX/L3iE3pC19iZ
 QuAG3NrQ6EIJp2oCClDchJ4F+zyiYY9ibkgN2bqWYhnylgtFyPO0uDE2X7aHsPz3jCtA0G+J569
 1F0/qCiHRuNWE0kXXuT85vi9xYqlQ3UlhzV6xsIYjpHolD1FEAgnWMKsaVwT1vTGvCtQqVqlB06
 VCvzcSMKMlQnRttViq8G/Z6sYMR+qO8IH8vGmpTGYn7uSZesw0Laf6cemwPa9f+dDVdnKjCPqpe
 lQ6TwWjh74bq3MScTKYjzvy7maJX8oryWCEeSv5bR80Lnrdvs0pWwzHXQPRyNj7RfbjARRikpwA
 0SwhPIAZXlcZ7K+2lDxhpb4FB1+0UcOUbtMa9cO1yJzS1WPfNOnGeUnOR8BKdwuKIOdxZawHj3t
 OUpSs3zJFPyBVDxxp5RPqZ1s7TZZaT/2KlCDlC+x9K6IaWFna0ew2LyjlHR9Af5WJhFQP3dtoVG
 Sg+HGE+D4ZYMCieIfkA==
X-Proofpoint-GUID: kTzHe5QPVThVS_uPL717FT87wkWPHAYh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX3HgyAxPIiy8N
 r9ZBCSt623zsVk1l9slmdRsL+IIRFGo+lrnZK24AW8/X5pDHAMjPMtxrccPhmaDnTsLO/gEY5sL
 oPtOHszX8+oajYJ4G0MdIxJl5r/qjT4=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a96c623 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=p0WdMEafAAAA:8
 a=W2b0fEEQJ4TDHmAVsWEA:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: kTzHe5QPVThVS_uPL717FT87wkWPHAYh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_053341_242681_CF21495B 
X-CRM114-Status: GOOD (  14.73  )
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

On Mon, Aug 31, 2026 at 11:49:36AM -0700, Jeff Johnson wrote:
> Hi,
> Here's a new pull request for ath10k, ath11k and ath12k firmware.
> 
> There are no changes for ath10k or ath11k.
> 
> For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.
> This version enables Multi-link Operation (MLO).
> 
> Please let me know if there are any problems.

Thanks, merged and pushed out:

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1211


-- 
With best wishes
Dmitry

