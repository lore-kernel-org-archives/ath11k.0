Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C23C531D0
	for <ath11k@archiver.kernel.org>; Mon, 27 Jul 2026 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bjyL0Mx5mA+obZ8zFCVX1dDW0MXrzq9zNvV5dazhMBw=; b=TMscxX4ja5eeMi9jFvkZHv4DJK
	uSqdt7h8lUUCnZ6eKMY50nny9BCyWO3A/yD2fw+/vjp003axbC30ka0JNMGxLvlbHE3JS/xNcpVud
	vmVJIHdrZwTkHmF02ePBdpD9gD41BpyT+h1RpM7L8aDJI1cjITlHHLiL4V2bICjooWHppLw0Bdc6B
	NuXOEI1K1PlWA6OC7nE1UN1DHNaE3MpT4ESoW5UILGEfxWDP97u+1/a21EKgu1rOsdEC2N0VTPtdK
	nR3DmTZxcLKlLxkjrW4u4UFM9aqZfxEbTDvUL7svVC4bDbRHY1goVN3R4y3TmADS5Qv+Or1vR7Klb
	CNnEBY9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ7A-00000002XcB-0wkk;
	Mon, 27 Jul 2026 11:03:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJ77-00000002Xbp-1vOz
	for ath11k@lists.infradead.org;
	Mon, 27 Jul 2026 11:03:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAM8pQ3322335
	for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 11:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bjyL0Mx5mA+obZ8zFCVX1dDW0MXrzq9zNvV5dazhMBw=; b=CxVptfrZdQjtypIj
	o8sMsvorVXKB/i3gC2hOejcax2LYHU9L3KQI1N0oTvW6oCn21GQ9GJJfVDeoSmSy
	/BSAyas86Wja5ACd+E/2atlt9FYKI10JohbyyMcxTSF1rG4urxJ6bysLlv9+Yzbc
	3ll8Vm+bsNAh0VJZWeB0wTmIvupp1a8yzFn7TPmHRn726Y3OMdye2YlcENlzLjXj
	eM9YmJPARmSwaHD+qK7GNG0rTsq/6axBOq3y8+x9GNtE0JwuGGUAIHUoMOy44nnG
	t7IsoD7o0XQlec2PZ1kDgYJa/coaXT9/0eaJ3JminwBNMpuxV4LY5IPBkuKysZy6
	zYzncA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2gkp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 11:03:16 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb835525b10so3079493a12.2
        for <ath11k@lists.infradead.org>; Mon, 27 Jul 2026 04:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785150195; x=1785754995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bjyL0Mx5mA+obZ8zFCVX1dDW0MXrzq9zNvV5dazhMBw=;
        b=IArfRcxTn6ZCm+KyqY5XF4nhGDiCqwIn55TUJ1aOybhDJB7prX4GgkSX4/GSmtKLQu
         ZIeCNyj0rdaxWb66yKvlg07Bjpsz0QUsezwuUypkGBnO9AvxrRh3E2BHlvvBxdvYR2iV
         R/nji40D5eipVCS2I4AQLVbJF63p0YAmP0d5pHysUkAPhcXKP24X/k9vobCwmE1LAnCD
         lwaR8Au8qlXcPVQTzFSxu/2qwPc96Q0yVh708YMSrrte8rB/P4lZohCHIZBR4CAHOtw/
         82x2AubBRR1b78QMoogfGFiScDv9s9Ha1WvR7fkyFov3V8HnrEQUSITX6F4en99AZDZW
         lc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150195; x=1785754995;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjyL0Mx5mA+obZ8zFCVX1dDW0MXrzq9zNvV5dazhMBw=;
        b=ki9fqopxbykN4f6jNrdMI0TJhYmhOzNcv2onC1o51n1zLN0xkWo8Z1C6ZLUQ76KWg5
         By0qokq6stjC3X+hVfjvcWFUvJW6smOdqeV8fy8ySbB3caVB54wTmbojCrP/QNldCvoF
         Z8SIepgG1s0hh/yzGhaqCV25QX7dKWSKaET2FLA8C+vEGxdW86TCYt+5s27DoXx9e2y+
         EyJoqUW9B7tueInv6HQFukt0S1GNNof9YZv2Q+uMe2MUiJcjPZTHTwBalDKV67m5ZvnG
         xsbxYlnWReVS0YBtuFEgenEaQO+a3ykDXr9po4C7CgHmG7qcJ4uWEuLUfcUHPix+TqeL
         08LQ==
X-Gm-Message-State: AOJu0Yz4s5AoONS+mbzY0/ya3W4lCMtuUD2o+UONX9UJu0+W8+HX5FRH
	enhE8mwzq6BYRGDntgOaAZUl6E80lgR05JLWc/UAGTwePUmw6EbiC/cs+PSB7Z/pSD1Zqw5v+At
	E+YQbeOl5ior+mJGI+pOhg7VuV7vi7SxLfuc7l2L/cnXu7RtN9DhcJGcfIKpJGpZw
X-Gm-Gg: AR+sD1111bTuHVBYDAmNtGH/WaGC+e2MnFsngU5mFLuNuglkoC9mXmnsGfGs7Q7qbC3
	haJ9xgiSC9tcyNMUoZ7pIR1YunW3Ny/wP4HgvFzDuchGneD081opHABKT7qnKxBQJSmQzFIUjKs
	2axWow6TEXgaZ6Ziv4kKpvAwLpbPDwe3xygF/1F4AIdAcvy8Qt/tvkgjK3WjxhFiXflWMFs242o
	KAQA4WeeZXFdU6CkZiQQ58d5CaYH2+zm3GWE10V2GqjenR1sA9SWTe3t4MLeVtsw31EBTIzP+qd
	5wb3+E0If8orwF+a8CwP7pqN+vwnO9OYwrD4ZEAo5WQxGMWcfHlT1X4ztxkzu877nQQPpEG8XZs
	QT9pAelh8W94p0VJvcSdl627OloOPiXkG6A0Zgs8U
X-Received: by 2002:a05:6a20:43ac:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c67dc41ae3mr7496093637.16.1785150195101;
        Mon, 27 Jul 2026 04:03:15 -0700 (PDT)
X-Received: by 2002:a05:6a20:43ac:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c67dc41ae3mr7496058637.16.1785150194687;
        Mon, 27 Jul 2026 04:03:14 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc413766sm32063360eec.8.2026.07.27.04.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 04:03:14 -0700 (PDT)
Message-ID: <70a367c3-f520-46d7-85f3-d7470f3c16e5@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:33:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] wifi: ath11k: fix resource leak on error in ext IRQ
 setup
To: ZhaoJinming <zhaojinming@uniontech.com>, jeff.johnson@oss.qualcomm.com,
        baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <b6903572-52cc-4c41-b9cf-5845e387c176@oss.qualcomm.com>
 <20260727065500.3827035-1-zhaojinming@uniontech.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260727065500.3827035-1-zhaojinming@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEwOCBTYWx0ZWRfX4yTxGrm2gyEb
 1Tf1f05WpApNmI5DDT/zjWzXb7o3Iys6HCfcaJYT0sySvSB5y6DT1HY78PTmUA9AK/UKJZ3eBNJ
 hN64XOJtYlm2yMLnF6BMndT3zKljCGg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEwOCBTYWx0ZWRfX1DfkmNz8b3eY
 uUmd/Xam/77PKboHRRvilBjjimoToDNJKhNYyFXIR4kpnG0IBlhUGUbdi8QJCSVrrvsry+MM8M0
 44ExmOfheg4qWziRpQdm+6h7+PoPzhDSV0grOHfBzysDxiILN++Y+FOCV8f2f2e8OaDe2TQ6Ir1
 dGJtkfUBYe7H3kGq0rSMGjW9ivZVdQ7ECuXHNMgWkAcq3RucS2bB/65SAjz+cCJ5gzy66Qn1m82
 u/6F1RcQQJ2ld/AjASUwp3vxgUNHh0ljub1yjCrQlLWLxMS53O5uoG06AYQqxX4sbFddURZgh/m
 3dBKSXb18Som5XW5yfXrQuhKiK3562Bmr004XOaP59wRYFKA9pfbxgiEeS2LXvOGhmgdAnrgJtW
 ri+z+AGrvAogffasA404K+8vkLSvNFjDAUNkCcV2QA0icyQKXc5gDrdsMVueNZKCK1Fc6Sy1IHr
 TpNTQrnIEj2+qhqGDMA==
X-Proofpoint-GUID: OlYCUKm1400R8HqtHC1NTlQDv8W1uv8b
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a673af4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=iHwBjlyiAAAA:8 a=EUspDBNiAAAA:8 a=t70t56v2sCmPkK01i0IA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=uNSKXYNwxGiU6LD0JREI:22
X-Proofpoint-ORIG-GUID: OlYCUKm1400R8HqtHC1NTlQDv8W1uv8b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_040317_619638_899F3CD6 
X-CRM114-Status: GOOD (  14.46  )
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

On 7/27/2026 12:25 PM, ZhaoJinming wrote:
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
> Also move ab->irq_num[irq_idx] assignment after request_irq() succeeds
> in the ext IRQ path to match the CE IRQ path and avoid storing a stale
> IRQ number on failure.
> 
> Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

