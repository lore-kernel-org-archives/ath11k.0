Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C803AC44532
	for <ath11k@archiver.kernel.org>; Thu, 23 Jul 2026 01:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwPIGZg61RTgdC0tQzXgf9LKpmSLanNFlteoC875wdU=; b=S3cQFnQqZ36P9C9KkN0ywxgVQ1
	SZ2wh4kUYFkWsomaVNypSZ8bcRn9BrbeXNCKfkbCY2KE7MFB6jFua8Jn0h6vSwBxoP0rSuAvS3KsP
	ORuG5YwjjT2hGGTwnEUF1Jm5lOlWGV3sZ4TVG4TiJzt1PUJMGD4MSW05PCv/c7g4uJASnCWYWco61
	WqEXYtHddbNvjt7IgP1AI2G+MsZlTVEUKU4IFVfQ3Bh8Nb4ZExlZ1/k/Je5psEPmqdXhf2rNxVEd/
	oWugC41Ur1RP91laCCYz8oReZ1rs9u37krE4FouOH8hT9eUQEQI0uG7HBMw5dbnXkE5n8J6MUZQa9
	DqlF5YcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmif5-0000000DBAh-1eGF;
	Thu, 23 Jul 2026 01:55:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmif2-0000000DB9c-3Rr4
	for ath11k@lists.infradead.org;
	Thu, 23 Jul 2026 01:55:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0X5HO3536006
	for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 01:55:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VwPIGZg61RTgdC0tQzXgf9LKpmSLanNFlteoC875wdU=; b=HfnjD/f70xJcThNO
	s4g6NGmWiANPgx8MMCSlXRCRjPSUvBu+Wv+0x7dinURcoPwRUchRtN1bQz1XyLAY
	cimgrqUE0f1aWVqk0jUTQI4rKnYPxcjtIiXO5z3Oci6vyr3x8h03uQRYDzlrCley
	9CigKc3yD0quaxa7bisBXd7AYrQFJ7iba/suVC4SxD77aEF9Ttfe7V3mHXxpB89P
	LCauTscyIhqHpcJ5qvQNEAFlXk9olgvspwzLncML8+7DZo9Lsy/l9JdDMTAFQ6wv
	e1bWPkITuRvKetqMwHzd/VaSugKN6m0AwVu6FH1A6oU2k2jT8Nof2x1VRYvw1fmJ
	de5euA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28xsnc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 23 Jul 2026 01:55:42 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so201155b3a.0
        for <ath11k@lists.infradead.org>; Wed, 22 Jul 2026 18:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784771742; x=1785376542; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VwPIGZg61RTgdC0tQzXgf9LKpmSLanNFlteoC875wdU=;
        b=GGOnCzi+KYTH2pgT3HEunC7vyoePMXnnR86v5H/CT7SuURAsyA/KPJwUaojYgHBLoV
         p2nP9zH/pD25xSswEmGuXfHlilAbKlx+SITPfvq0UT1RHDwt+tCCzzdkboVC0L8yGsS6
         kMXPGuQHo45YLXjeWAhuujghFniN1VmbCd9ezA7XuMudL9jUrHa6iu9WQqkegkfm7Mzf
         NGECqTOzw3uDHpUwYPO5F8rq6mThVOYyRcHFjXINtxTD6XA1a4s2vIEslww/tgc0Dipx
         u2EKnz3skGXoWqk0vilzaGD4KlTjexcNcvHHzyjPnlSHfYpNgdB1X89K4WE0LEkDrk3E
         Fn/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784771742; x=1785376542;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VwPIGZg61RTgdC0tQzXgf9LKpmSLanNFlteoC875wdU=;
        b=Vi0CLSf6eQfqomOK1tcDsLYZO3J4q8qYWLDsC+olrfMJIvBu5TkCcFdfhJt7dzelNb
         pgDCLUc5Ld+2LuBSZ/1VRMLFyxA0pzSeaWWm2wV7MJHbBs+aV1owOivmaWLpEesQ/V37
         Q9qob014dcS1KVFX/7UQ8L6uWqQygEBzuQ80AGpiJRimbrwY93CdzkZvD3wGcRb5Yg1Y
         4UuajTADqo498iBVwt3FAXjngmaesfMdmzYVfAbXIwAIyx/U5O5XNPJXc+6QMSPRxbcE
         uCo4ZCFloKHesSR9K543R6F5VIydBvct4QAWl0P2VFJZ4WMklwt2jWu7hdcbTtpp82i7
         IwXw==
X-Forwarded-Encrypted: i=1; AHgh+RoZFgmK68HNhw6KVsqYkinrbrrpAKt84h7vdvZj9tQaYLG65nVvWrrZWX+lxoUVETxxvX1ue18=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0QXT8b7/C/vsErlBDr5bkFs+PmrDQlfS6TzxgJ60meOOi1+4f
	b+KWFAVoGUt1U1zerYsW8VZ9rfMoDkpMNH1ocZ4nolGu/AglidImNGIQvan/f5vFLIr1QarL3Ei
	VluDizk3k+R7PXSeFc1FjTcBzqoE5U/QCtV+hVR66rM7cfJxlwkk7qbidxFm/c40P
X-Gm-Gg: AR+sD11aq9yjYBn9B5IU+jJpW2w1b89NPd35FcO9yFGE0agsgmWCaKtLVK0nUP35RmO
	a+gAn9G4qjLvmjTyaPYK681ZqfJ1ByYlLIYlsbxzpdE9LirgNCQHmblp3qX3ds7Q4Z6i3WZeKcl
	IVWhrh5ycrtRluWHUf4VKZK+8HNUDTPZWFi6sChJW46uajwTnurL15SMbnO9asgUcI/0CSv2Nz2
	XMIYcYXiSIal0v83YeiTzAv7J1S2403kcOQb5GFCaWfEfdrrpNiCLCr6TlVc7OAbFvY/+1S7cn8
	PLoUlem075J0BZeJk52jbwFhGMaRbNpzhdHRHI24KyvVivEWYmQoCZ/tdguz8eJF5N/jQmTPmGt
	8X7yjGemYTVbeFoO8IcwT2/iPr+v5sqxoNe+0QdeM7wvodIiTgeA2u2hpQoC+cGdQV6S276m3
X-Received: by 2002:a05:6a00:2e8f:b0:848:4190:ae72 with SMTP id d2e1a72fcca58-84e2bb54b03mr1442302b3a.46.1784771742135;
        Wed, 22 Jul 2026 18:55:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e8f:b0:848:4190:ae72 with SMTP id d2e1a72fcca58-84e2bb54b03mr1442276b3a.46.1784771741671;
        Wed, 22 Jul 2026 18:55:41 -0700 (PDT)
Received: from [10.133.33.45] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e17604a46sm2154683b3a.60.2026.07.22.18.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 18:55:41 -0700 (PDT)
Message-ID: <8f82a267-aace-4007-8fc1-c31d9065d059@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 09:55:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260723013818.393470-1-zhaojinming@uniontech.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723013818.393470-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: X3NvGiSQnjoqs0J1-0UI14fNh4wSu2Ja
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAxNiBTYWx0ZWRfX4TkoHUc+y7K+
 iLyLhBs7RWvvZy2CuBhmCnnG/8Qd/pAsh0lc0Yoihg8YAEd0m/XU/B85FoFHQUmB+E71vqo/Zpq
 IFz4zNl+4Asmzu2AKy0MSdvdE7LFP5U=
X-Proofpoint-GUID: X3NvGiSQnjoqs0J1-0UI14fNh4wSu2Ja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAxNiBTYWx0ZWRfX1LRgmzwrptB4
 sTKLNoUg4kZnzewa5WWNyzVRFC6rW47yqBpLx006KfR9Hj7/+coFeqdsPa9Z5SKWlBCPL2IL8dK
 1INDSnf2FgALIl1NPIeI9rCUlsSEMVJA3ITQk+DkLrbVtAP6Oy+Q0ZmCyK1Tu57wek9UTVZm/SP
 E4FD9phZhAG4ye37HtZ2KeuQvhV0HMWl8ldJ9G1vrsPhHmWc15PERNJejOW3CG+e+GRN0d1/1Uk
 b4NTqwNQ0j1b2Z+tvL4NbiHSTulKFwUwJY225yFVS8agmllX0aY1O16YcqQ5jEn+hCTcZnUk4re
 TV9eMG2h4ZNCpStyMPlWAKUsEchp/WHGMsuxXAQkdDEaH+Q8Sy5MmzTKDH22PDOZVy155inQvk4
 0oq2WnZggp4dQcAx40+T1vUvkCtcljlbvo6zJwO77qpBZmZ1tOybvlzJ3FlXctPM8u4cMA+sTgr
 n6KNm2VKh54iLwN30/w==
X-Authority-Analysis: v=2.4 cv=WNxPmHsR c=1 sm=1 tr=0 ts=6a61749e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=iHwBjlyiAAAA:8 a=EUspDBNiAAAA:8 a=MOnjC4vlygQvvV3irVYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_185544_922029_AAF7AD78 
X-CRM114-Status: GOOD (  13.94  )
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



On 7/23/2026 9:38 AM, ZhaoJinming wrote:
> In ath11k_ahb_config_irq(), when a CE request_irq() fails, the function
> returns the error immediately without freeing the CE IRQs that were
> successfully registered in previous loop iterations. The probe error
> path does not call ath11k_ahb_free_irq() either, so the previously
> registered CE IRQ handlers remain attached to the interrupt lines and
> are never released.
> 
> In ath11k_ahb_config_ext_irq(), when an external request_irq() fails,
> the error is only logged and the loop continues. The function then
> returns 0 indicating success, leaving the device in a partially
> configured state where some external IRQs are not registered. This
> causes enable_irq()/disable_irq()/free_irq() to be called on
> unregistered IRQs during runtime and remove/shutdown, triggering
> WARN_ON(!desc->action), and missing interrupt handlers lead to data
> loss.
> 
> Additionally, if alloc_netdev_dummy() fails for a later IRQ group, the
> function returns -ENOMEM without freeing the ext IRQs and napi_ndev
> that were successfully set up for earlier groups.
> 
> Fix all three issues: propagate the error up to the caller and unwind
> all successfully registered IRQs and allocated resources on failure.
> 
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>


I have given my Reviewed-by: tag in the v4 review. Since v5 is identical to v4 you should
pick it.

once again:
Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


