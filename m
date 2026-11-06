Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367E2606A326
	for <ath11k@archiver.kernel.org>; Fri,  6 Nov 2026 02:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IEVLwgEL;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cX3k6+o3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gurz8qLx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FI80B+nNie9zTSHCY3+0rdCsJu8kCjduFpHKAP6KyEk=; b=IEVLwgELKqAWEP
	hN6kg0X8SN5eX4pieCnKpKeAnEx0Inmt4QgAPdRYcuVhL2SmaPD3eahy9hZo/WiI65oxdYDO9gBVE
	wUIWLoVz4ETYX+SVersTK/lQIscRFDno4ZNivcNNeth9v3RNFDNWurEsCBMG5IZ1/NBfFYk/iu9mR
	GCexPyCOkIx3+gE4rDfw0azZb8yrCPVHGbyKl1H8N6rE8XKXJVbXveqWQqfw/MPyc9Cvk9AtDhvBw
	v4zvvtd0PXRHH28Ed0G8BEmTiUlQ/hiOPACAtMI8F9peh75wOPSUhZvoNLv/oHox1OA9lz1GxeWBc
	qi14AkvnlSU9UWtwFl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9pl-0000000B5ub-3bJC;
	Fri, 06 Nov 2026 02:37:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9pi-0000000B5uG-3lFp
	for ath11k@lists.infradead.org;
	Fri, 06 Nov 2026 02:37:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NjGmx669820
	for <ath11k@lists.infradead.org>; Fri, 6 Nov 2026 02:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FI80B+nNie9zTSHCY3+0rdCsJu8kCjduFpHKAP6KyEk=; b=cX3k6+o3+lNfW68K
	1HZ9gPO/cBOMoMWXrqHloeDAdwqEvFoL+a6umAhR4QOJGuZqnPtmsYX70V/ga1Ik
	Q84v6R07jUToYDJI/41hB/aYk5rdeaPDymcXeR3/2CR+0R43IbpkNf3z8csIMzux
	+8v771YAiUIuHtaBDf+NVTzD4jhr32Er/gwFwtujCafwkUcCjK86I5OC+wxhDzJl
	SJRyDilDwlXQRwUZmkfWluevw66pEJENDohem5XgJCEcL09ma1BPRKu7F8q8k0xe
	3HaKEKiU1O0CiRnJmsa5pcqOivJRSAeDvdNE4HGSCRz1GjC8WLojmmztQjdseV1U
	ZEcPPQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pc8hfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 06 Nov 2026 02:37:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso221432a12.1
        for <ath11k@lists.infradead.org>; Thu, 05 Nov 2026 18:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793932658; x=1794537458; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FI80B+nNie9zTSHCY3+0rdCsJu8kCjduFpHKAP6KyEk=;
        b=gurz8qLxiWeQCXSPtv7+TmIHjrJZywsVd4sdywtG67Np8Vh2/FV5yu1D56452lh6MO
         WcA3KlFEFHvCtNbcsk122oYPl1wqw+Hxeszy1zcGgZHYp+A1HGhrCLYB3tuoEgx+nQzm
         8xYsnj3XBOKhibjrY6S8mY/m2cCl39v1ntFdY++5z4Kq2hGn/BPGoG9QNLL/so7d3eDo
         7pbqSNJJOHpzwwgdSQ7spQtyO71i0k7wNPKG5vplaqnM10QbHhwxSjrwXQiuTt1WfSD8
         tEyMo3V/OWeUH9/tujUWbmu53k1zjr82Wkq+Exj/8KnM03bkX3HCfQbHhVmEdPhqM09b
         Ev5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793932658; x=1794537458;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FI80B+nNie9zTSHCY3+0rdCsJu8kCjduFpHKAP6KyEk=;
        b=lNS0zqlH7ziTTW0GVKsAIQYiGswaDMPr5J7F1z15aMhkWXsSX895NQiiw3yV9WBCvB
         WdrTDlMXakdbPniWZAXPYKOh7s4KpiOZ668KOYyffstn1C+yExeapcOFdESRj9Vyomrp
         LZnfnaifoUQEDf9YAZIaZdpykR2EVwhJNJE5DsC+c5p750y9vuHfzsLjTBFdhNrp1upC
         sBjSwvYe8EIbiYCLhUkMCHm/cLOVJNkEzZ4qVWD3MJajQ1h0QjBl8wLfo33uG7N7gGzq
         wY/sLj1giGdCaeEJlgThh4r9vUDiMpVPkB8op4oqeUY68LTb62mnQLcti4YnQhlLvSSH
         qKLg==
X-Forwarded-Encrypted: i=1; AL+hErFZUz4NBblRR8ttmDka0ypzeQElG881yXaRSBvoFJO7kA3UcXe+d/8nH3AfGnEmrzJ/SeGPTC8=@lists.infradead.org
X-Gm-Message-State: APuU4Z+k0KV3D2nFcuWxGb1xQuSHwcSy5ouYynxGAvkg0DbK7xM+TJhW
	ldHhGTc/u2geyrDZtjIlshk7Zl1MYWU0KT4bb8tkU6LSDi254A9nJlqUObP4RhgRAqAoGEEDgz2
	wUgyVHlBgF8OP1nO4xgLS4/zKLtImsrold6kYcX7uoYL3CkwGOjIB+AqPSKmQX7LV
X-Gm-Gg: AYBFou2ehWDCF5JwpYhmwmYyj0TY2sSTkFAXXhZKFP8FTLa5NVoO4bb27zjDZ1y0iEx
	NoplwwWR2O8igSz0g1pxbev6p40NkbeLqvz1zzirbue4Uihwv3WydhNjgo7T9iPtSQgQslSGnp8
	GlSS3u9mnfEWYhzEihd/G8YCSFxog1Rq7Qw+haeM+6IVDOcAX9GW7VYZ7zkopjO86luMrjimN7K
	MS1i/b+Aqof4RIoD4Uz9cyinB/uBNIY+adwRaMsIHgMdmfQMu4K9fMBnigoX0LJ5SIT74C3rCfB
	e0GcIZFbr2CywHLkPpJricPxpDtTHxSLeEWFXWBw1dLPCOn7Z8phtL5q5C6YWbItojwpXF7075U
	UAI7IalSbRkUXoeviq/IjcqD1qsUOSp87CkAc2U01twbljj2vKwnL4EKMoPSLDiZhzzAxMKLQMg
	X3WjV9HzcLOIMSkphyk3aA6PFLN9L5fGw3zShk+R7UmkCKFw==
X-Received: by 2002:a17:90b:270e:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3b0db6dd119mr1162555a91.41.1793932657746;
        Thu, 05 Nov 2026 18:37:37 -0800 (PST)
X-Received: by 2002:a17:90b:270e:b0:39e:6a80:b799 with SMTP id 98e67ed59e1d1-3b0db6dd119mr1162518a91.41.1793932657155;
        Thu, 05 Nov 2026 18:37:37 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b328a04asm5705831a91.14.2026.11.05.18.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 18:37:36 -0800 (PST)
Message-ID: <108d86d4-3b0c-41e6-9a2a-3cf34ccd924a@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 10:37:34 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v1] wifi: ath11k: add usecase firmware entry for
 QCA2066 hw2.1
To: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <linux-wireless@vger.kernel.org>,
        "open list:QUALCOMM ATHEROS ATH11K WIRELESS DRIVER"
 <ath11k@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261106020809.3580396-1-hongcheng.zhang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261106020809.3580396-1-hongcheng.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VOQj3Y6etexhM4bPEIlEnj70XfwWtrUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfXxLF00vuRfwml
 P91xD+y9aZhHPACvoBrnNNIqUze/izKIuIUwZkJYf2r5Hfk6j0KgqU61wrze2MhFWfS/XbsD2ZC
 8mjAcV6L5bf3E/rKYmSI8Fm2NItOWQDCR/r0Ufxpo4maQI29BljjFTMh8QL8eg9rCPFFZNMAcBR
 24KUhWC0cg3PX0YAqjj4jAbvBjrDai1AVGdazoTZQn0sR0KLYcX1KqP2wATWf/5OOxeLIcGP46o
 fQoBoiFl/dvDQD94VL0mLYBlC5WXUo+J4oDgmDLPKErAIL2HOIXjszT9VG1MhmRGBmdKt7OmY26
 7m6tpZ09yxQfHL4HZsYGA6CyNAlWK7Qx2qmLm3SutuJunvMLIn7VYPTD7aareLGnPjozp/+nAFH
 WFAEZbGDRdfNk0NngJ05+Fp7qju1J4nCWyyrn5HautPRvdnHHdlXrashOgcj71da191mmTu/z4Z
 usvOdZmx6BtfSNtwpUQ==
X-Proofpoint-GUID: VOQj3Y6etexhM4bPEIlEnj70XfwWtrUJ
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aed3d72 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=38uOJd1x8bnEsvVciosA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMCBTYWx0ZWRfXx+n+rLuUcuf6
 mHP5TGnvd2A4xHiYFCx9B04eIfb5g2uqebOs+TTuFkBfeVqAXEWIJAm4wt6H9dPNiltjoDCZhf5
 Nq1VnJCcJ0ZqH2tM9J9ukLDTQu7hwok=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_183738_941472_C3FACC1F 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/6/2026 10:08 AM, Hongcheng Zhang wrote:
> The Monaco Monza platform (QCA2066 hw2.1) requires a usecase-specific
> firmware variant located under the nfa725 subdirectory.
> 
> Add a new entry for "arduino,monza" compatible string to ensure that
> the correct usecase firmware (nfa725) is selected.
> 
> Tested-on: QCA2066 hw2.1 PCI WLAN.HSP.1.1.c6-00302-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Hongcheng Zhang <hongcheng.zhang@oss.qualcomm.com>
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

