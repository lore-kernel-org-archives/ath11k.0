Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9CCFD0058
	for <ath11k@archiver.kernel.org>; Sun,  1 Mar 2026 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3g4hvhPOBu/m/a59RHoAfuHq2QAxMQagDMMQEM8yEWQ=; b=jY1fKBfBbhGuxOChFIqsFUFoan
	SfdgoW+MxyfxE+baZMOVXJcF2rBB3wwZ/+XTVP4IkiCVJSIwI8RqpxAa7L9l+0FjhoRKURPJhkMSw
	cKo3r86j9N6twTZqxiBDn9CBp/o+CnS/mb7ogLMM953EVbg73LCWsAht4ZdIW5aUv2Z4M9+C6Uf8z
	DGGzP20cNUeWCOAkPP/0JLOLjtTx4qrjs15KbFJU5vXN/cEWk0WVT0lbCIfQ+AG/fHEztuN2qQdDa
	khYqAGZED0W+AtCZ0HGtEmrNqrHOYciP49wjWXw7GeWr9uDLAKp3XJcXERjvhq/1KVN+km5xeZ+Wj
	Q5/Nh7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjpO-0000000BfYl-0kfg;
	Sun, 01 Mar 2026 16:39:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwjpL-0000000BfYE-3g20
	for ath11k@lists.infradead.org;
	Sun, 01 Mar 2026 16:39:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6215P2F6329026
	for <ath11k@lists.infradead.org>; Sun, 1 Mar 2026 16:39:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3g4hvhPOBu/m/a59RHoAfuHq2QAxMQagDMMQEM8yEWQ=; b=TXe5sYNu3Uv7BItm
	wmiK18YE7J0KwatrDcfCkh2XyE+u+0Y9W7mJKAzd9x8/f1j6ePcl+4gBC2kplBcJ
	WGCiuP2ts0Fo90pZKpy2OBGRekHgdwY3tybqinBWgmELr5+O0RXkXRtMNyuf83gp
	w2+54VY3P60rzrryJH8Ta9NFY9Px4m/dH75/oPt6cdyrB4q39+8uRhz8UkxXJx2C
	ISOTiTUN21kRPpJYfqItD6ZGpe8H0czoA6B7KirX415VipK01rJgUK6xvri5ZTSL
	GMuJ/WXHom7y02L+5eDtGIF+fYqb8MweKJ4JWp4Bb57Ogj7mhSS1j+TpfsN5qpJB
	T1HD5A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksgru0t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 01 Mar 2026 16:39:30 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354bc535546so2889886a91.3
        for <ath11k@lists.infradead.org>; Sun, 01 Mar 2026 08:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772383170; x=1772987970; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3g4hvhPOBu/m/a59RHoAfuHq2QAxMQagDMMQEM8yEWQ=;
        b=H4t4/V63oSqURP96yZT6rChMjCApCo18jto1N7R0772moUdtjSSB4nkW5pLO52F+q3
         vq4deQeyHrgEZr9RLJ2EgKe4AN+Ev8YXFrmCZzdXM3G90sk6IHP7/W2SGHkx4RLWCBq2
         9+IQluNTADWlshoCqbBg6oMgxEvT0IARCCrxlP4K1sAzaipRlwxzCa+FMuQ2LegMzJ1f
         lMrWAyNrRE44KIsdQZ5HSU+4kDRfK4TALhfwl+Op6UJgm0C0aOu47noACSfZ8qiUqTqi
         sGd9b7oaKzU5STKQ9u9RtoCSkFDEr2EDX6pIhyrwiVvJMjS3vxKfZcPLPjGCb8499AaK
         leaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772383170; x=1772987970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3g4hvhPOBu/m/a59RHoAfuHq2QAxMQagDMMQEM8yEWQ=;
        b=Qqf1y1hdCyN2T2V18SmsTR9wRrua2/5H0vW2EjMH98vDOaJojoaIyD2uQTeSRfBaTo
         L8ShAJNe9QxXraJwzmLhqalOevARJDTkaY9WR8C+t+1vWm0IHopbmhcxubUJBS8p2uOd
         J4ndZn/Hxr+F8E++QW8DPI+Z7gmPomY71lPIo2T9Fcgu6XPSbQyzh8+svqJcmG605Ne9
         jTl3mypD7iKmm/GEuPHPkd6W9Rjl8Z57Touh6jpm4Uz8z1Rq4W2rMTThX5EBm3p04fO7
         AAVs9X+FHKp+apAXXBudXUyI7ZZeInSoqTbGKIAJysLF4vc4vmhfRdkrYsl71pwXN8cu
         YELA==
X-Forwarded-Encrypted: i=1; AJvYcCWmlS2aae1NgK01X792py8kCUBHfbVMxsB/eLSbArZ9P3Sv9UyCwDluWaY1dNtcwNH+/boNgBA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwIkFhhWeMf6ws3MXW7/S/fWpR1MUSLLLm/K4UbldAS0FsHxnEL
	rrB06iFVbQ/1Hm1vddFlqBUS5WNKTaSxxqgGfLdK3QhcIkSP5UYQmCew5ZAzSK/chF+lmra4Pn1
	42YX1y2L7Gs2CC8ClTAKXQrzKEaCsZbPMiG0tfOx7aw8Er2h9AiutgLk7myB3Jhbz
X-Gm-Gg: ATEYQzzlYwGYmaAKNPY1533+aWHps58jI2nULRkjVDrrdLhqfnoMYecqHR+C/N9s30Z
	1xUKsm84lM99J+9CLA4CZdBhwQ2tD4PUbruPhHzXxjMene9NwJkESBC3dAxm6qFVH8vKaZCoPbp
	VHO7H7e8EHBzKPrIjRjq4RTgvkMJ+rQ9gUVuH2V+1iYRlHiOXy3PbtHgUQTBn1gfFIw0j/9Py74
	cP4QROhQ9R5MXJZWsQQb3XFlkDaIAtdNZR7O6kAIZCyhm6IxsIjC/s9NSsRFo1PtlrxDDNjgi0j
	bLM224YOQaMS4fJf7YCuGv89gDUAPfUQXB43VWsVboEYkFXjefBmLg6QQHgkN7MmByTvBcn7qgf
	moauUYT39YnP9VknhXKG8XL2ss2qDW10pBVfW7aboXj0l2cvPCsuQknbbHTmlq9x28QA1pPS0
X-Received: by 2002:a17:90b:2516:b0:359:8a78:569c with SMTP id 98e67ed59e1d1-3598a78597amr921788a91.25.1772383169819;
        Sun, 01 Mar 2026 08:39:29 -0800 (PST)
X-Received: by 2002:a17:90b:2516:b0:359:8a78:569c with SMTP id 98e67ed59e1d1-3598a78597amr921779a91.25.1772383169274;
        Sun, 01 Mar 2026 08:39:29 -0800 (PST)
Received: from [192.168.225.142] ([157.49.104.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3597a23acaasm3262757a91.4.2026.03.01.08.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 08:39:28 -0800 (PST)
Message-ID: <5d3d085b-9480-470d-bbb2-bd4a1fbae2c1@oss.qualcomm.com>
Date: Sun, 1 Mar 2026 22:09:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: A question about supporting the QCN9072 radio
To: Dawei Chen <dchen@silexamerica.com>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>
References: <CY8PR19MB76432CFEF9F0BF8862EE4D7BCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
 <CY8PR19MB76437B84E62BF9881F7DD48BCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
 <CY8PR19MB7643FC8B2AA5ED9707EB479CCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <CY8PR19MB7643FC8B2AA5ED9707EB479CCA70A@CY8PR19MB7643.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDE1MiBTYWx0ZWRfX8peXG38RQxiC
 UMKSw06EwKFkMA3s40JFUlLfibBEJKL93IK/jFp5xZFWGjXbFNbSV2zLJ/3ZzjJKDlterGL+O4j
 S+EVbc4h/HiFYFOSK6axBWMYFbQauIOnaSw3yW/v9rm5Tkyi51Xc365YWgHEwk/tYeeiaRgAmYc
 ap5rPZRO49vpT251dUBZ6dUzIm2uq5kgcXL3HcBXnLatEceeDQhsZl6FPpQc7VE9lwhi4oTCHMM
 EYgaisqM1P3GqGmJbzh9Dlwdz9RUCa9Ys7c30FXWqgGIQ0DWfUuT03ncCJCokY6yxX7CqtXdDCM
 P5Ny2RZfSGuXzqV9PUQVXvMdDe6ioBA/NzepHFyxX2nCYUi3jcfdzTLSEKURj4PEPvwAi6PG/w6
 wlYm/6O79ANJghX/IUhwN1o6TCdmt5gBiehfaYvw9VyoqHf33i0dF1hUcGFNi5sMP3pShkjlpC2
 b9uBHgouSHCf+EtVBPQ==
X-Proofpoint-GUID: nXrvGXYGos35wPFNuPqh0qjrv09eloih
X-Proofpoint-ORIG-GUID: nXrvGXYGos35wPFNuPqh0qjrv09eloih
X-Authority-Analysis: v=2.4 cv=Zqzg6t7G c=1 sm=1 tr=0 ts=69a46bc2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=7xyHC9WGgNJUiZuyE+LlxA==:17
 a=BSqXoJVqd4DgX87H:21 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=Y4vKNc7_66AgQsD715MA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_083931_922334_977614FE 
X-CRM114-Status: GOOD (  10.00  )
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



On 2/28/2026 7:55 AM, Dawei Chen wrote:
> Hi ath11k team and contributors,
> 
> I was wondering if anyone could confirm if the latest ath12k driver and firmware supports QCN9072.
> I am interested in using this radio and the openwrt stack for a router project.
> 
>  From my research on the internet, I have not seen any information that explicitly suggest ath12k support for QCN9072.
> I was wondering if someone could provide guidance or opinion on this QCN9072 radio.

QCN9072 is a wifi-6E chipset, pls try ath11k instead of ath12k that is meant for wifi-7 
and future chipsets.

Vasanth

