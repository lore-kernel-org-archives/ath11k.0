Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42902E92FD0
	for <ath11k@archiver.kernel.org>; Mon, 29 Dec 2025 20:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=; b=4Sm7FEPcUYwvvoXH5SJNf7O+DJ
	PQepzWNPq1MnDUGjrxZfz7yO+ykHG5YFue/KBZpYqtExNstxmGKdI3I78ytJzpb1LZ2EEKgMEOdAB
	Kl9Y+gFRj8D6mLWDrvUabpX2P3xajghWoDk/PGa/aiGIYOrLGmwCDh4GTmcDMjRSGGaq6P8AS6QYe
	EI/0tR0OjeZnQ3DdtB6MXO2fSoea6vtpHMMELY+bSnSjbhK66laKvZfVf6UnM2VDb7cALjWlg4Od6
	rhexlIo6v45CWih1WHEM61n/VoLNBEWecxET6Chk6SWwepyu2NZ50uVHdgmvvtw2wYZu4/cjnqg6m
	8RS8teGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJkW-000000042qW-1f4j;
	Mon, 29 Dec 2025 20:21:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaJkU-000000042pq-18PU
	for ath11k@lists.infradead.org;
	Mon, 29 Dec 2025 20:21:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTA0CGn4087696
	for <ath11k@lists.infradead.org>; Mon, 29 Dec 2025 20:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=; b=KlAdv2ubMWttmbER
	zK1m+HlhknlB9IltkrkURme8qcJDFJ+ZfDlbtrT4bO63ZP5p0yx+Yt8/PEmB7e22
	ahTfq8OgZvlgXY/Fsb8iq2Hnn0nKA7XFrPAgv5htE3T0qjnlfrTng8IXvQR38wtG
	dyS4TuVPF7yWnkc9+GkWwkgFnvdzpeOMNt3YbmgDgTpzxZ6IDNNMTu7cVEt0ApYd
	RQLEh2PAj9p1gENTP3jl3g3yILavYaUsbAem52ycezS2xmen9DpZqC0OGQFJUvui
	8gdV093GMKBOXuEyX5EfYy6KfwRshLAHXVDpYwIjScRmISHmwSoBA6hGexuUMRA1
	OFlloA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hsdb9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 29 Dec 2025 20:21:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11bd7a827fdso17720227c88.1
        for <ath11k@lists.infradead.org>; Mon, 29 Dec 2025 12:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767039708; x=1767644508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
        b=LvoAROSBR/HFHenVfjskV1WYnTrz++qOlg1tDjALVhgtXqh8QY4G2g8QebWRdH49s4
         mpWNqJDIzXG5Yy80lhpQUhECoQF0gQhODcTzwQTk38eWxsl1BD6ESAKshP3HJjmh8+As
         dGwY06ZyBBPvgVQNArSYJY7lzaad54u7AuOp0BIAIKiU3hVieYr4JcoKQqAFyXEtBFpQ
         ly4t6zeEPCstKJxUhxkbRpZU1lUUGQHMjfOmRN+GKAEJyyq8JInSmw/VDbhe8GYGyN3g
         sPDpxi8AVEGsIPfjWi7J9M7h0jGXDCi/bx956eo5xKDuSprB/6IRkBbW45bRe6rL5kTa
         WSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767039708; x=1767644508;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dpoZ5UGiip2J0KzaYSKkI3NnTZPsWCC7W/z4CEwTEwo=;
        b=nICsRsisMNZuW4JjDVLKCcqhzx722A2Oq9047aub/4My9I9jAG8QDQQPiyPAQI/a8Q
         jVcNjJAaa7WhbKNdMFS2op+31SjM2sdQ9/eR4uJ+wP6BBfEUjB7lIDr1KeMoVuVKXfmO
         9Plfylr2tJOPcJeeY9kN2NdWkEUpqJquc5nlOiKzXUj9judO+Vx0l4jbBFbIi1UQUWtT
         aMCra8HOc9lJYP3UrQYZHgELfKCAhIvOSqEYavNnW6vmGVOEl5uzUyBIIATqW8S7r6Hs
         1SPseqCsj4uHrh175DSDW0QW13n6Luspw4MVbRX/O/Art6hrmk2FeGByKCSOz/7RNg5A
         hOew==
X-Forwarded-Encrypted: i=1; AJvYcCW0845LziLkARh+qfm2pTAeWNdjFeaHRFbTUw9drWP0ehjw4WS4GLDfZLkwabnDA6oAdjp0TDU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ0VnkoCHqW3bupsUiLoiDnFELHd6OQkRnvQfeKNY77rvqilFR
	5yEW0bJeHWk1AUeT9+t6GpDEDYKn9YcGGYG5Easf/mOgcnyHdeYuVSbz6itX4rPjILEWqwyhO5k
	LF0P0HUM8x8iyi80RAfFqZFp/RZKwW9ngTapSZFozYD1qMDNCW5zqaqN69xvcoXpi
X-Gm-Gg: AY/fxX42txNxxt28eBt+rAYnGIKdwM8N6n419K0KzI76699cRpL4uUhnfwJnXqMptrv
	uwwm8b/O6kEzz8k5C95tVFAypUFSYxEKMgwa7MICFulQuWF3cvbg7unKwjWhuTlYwQajxF15fWc
	PjZMcyGE42TME5G1/1HC6Si1d7yW9YeBba6/0JfG9GvU05AmiEEyWzaAccCQRcdPdgc+I+ujBw7
	wpS1P+agKCksZlJhh51VnfSu30XZS7SV1Fol3QEiD+l3y2C7T13hL4bD5GuBuF9hNmHMg1T1SwX
	E3E5AuYPLqylVoTvrGlFlLSE0VHMgPew1YLzxH0PPKOWjNaLQ4RQ38Z4JH0viJGyrll755p55FF
	+E+m+TPEPrkMIzH1SnTiuzNxBOR21GEjNowvgtJ0jURLGD6Ju0XgifFY2PlhP2cs=
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-12171aca672mr31221590c88.12.1767039708197;
        Mon, 29 Dec 2025 12:21:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IETQHo90sIZ9Ah2oFCPURRgJ6JOFVSXKLGKjyL2O2wo5JOl3Bs3GTMtBAiIr30Ft0lRKlNsqA==
X-Received: by 2002:a05:7022:204:b0:11f:19f9:c5f9 with SMTP id a92af1059eb24-12171aca672mr31221563c88.12.1767039707617;
        Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724dd7f5sm120318362c88.5.2025.12.29.12.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 12:21:47 -0800 (PST)
Message-ID: <9e6d2c54-6c63-4cb9-933b-3647c25fe72d@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 13:21:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] bus: mhi: host: Drop the auto_queue support
To: manivannan.sadhasivam@oss.qualcomm.com,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
 <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251218-qrtr-fix-v2-2-c7499bfcfbe0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cD1Q0jXrvrnJpDD80wTvyUxOmDeEScqu
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=6952e2dd cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gPICEALkPRU_h5exja4A:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: cD1Q0jXrvrnJpDD80wTvyUxOmDeEScqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDE4NiBTYWx0ZWRfXzQLWSOGu6gwN
 trc4s41pngQb/eKclcUUTCqswyCadmkDk2gKrGX32RBkoG2NI9uKve3r1vXHGH0ykeqEWLjMqIC
 pJPgNIWKxToLYIrHRlgaEIbhJjWDqxGp+iPAhypLs9EfMoF9h17iiEs9Si2bfh4NeLwlrd+GzVT
 4oAhHKziJkncJ3RVC79em0UvAEjQtXQYq1q3kDPLHJop/DBMTjGzYbLvYN+Ftb2Osoa/YGXPGoj
 DrShSSx0wHfhuHJyu5GDXzhd2gWuGpDC/4v9YnFMyFs018FEC0N5k57n86WfmadS+QCwy9uNXJy
 xIjdT9pWdqcRVpv3VjArsuUpUgeAaP+LBF6Hsn4mZZ1B1GLCgcuh6VD3uAUGLv3SzFhH+Usygef
 w0cGjB67TvVO1F+DqEXEXhS4medstc3BozfEEBaISlHpxXCot+Gp5hm5fdTQsZUgnN93ZbljAjJ
 FEQzKOpKxuuovEwGs3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_06,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290186
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_122150_438978_327E7948 
X-CRM114-Status: GOOD (  10.34  )
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

On 12/18/2025 9:51 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Now that the only user of the 'auto_queue' feature, (QRTR) has been
> converted to manage the buffers on its own, drop the code related to it.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

