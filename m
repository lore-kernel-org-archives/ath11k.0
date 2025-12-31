Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E965AEE6429
	for <ath11k@archiver.kernel.org>; Wed, 31 Dec 2025 10:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=; b=zRpUUU7pyKMqJn5jxcvu0NA4dy
	kaJME1ca2GC1JxA42+mi4rZx8SEIKbb/hidHmVSRIuBQ7sLEwHKLJdGeH0O4HAc15+o+TNQ/ZhK3J
	yKRDXnZ0SVeCyrZJk4yemV2xgVw9Y6lttNNyyADT7YKPXbmIoop5YbYZT+NjsOa1B2pw16xrEiGvQ
	guGdCugnmCDVu+6xPSwAju4jLvLGzSaj9T8TNrK8WYjws+ZTHkJ4FMsrpEkutJWh01qfFWeoB96h0
	ldK2lf85IJJjeq/Hn7zLPptYDHFeQ3cgetyOhGxr8lvr85jpdtxiuKopFBcwJB877Ly4miT68m/Gn
	IHYeiijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatrz-00000005txz-3yEM;
	Wed, 31 Dec 2025 10:55:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vatrv-00000005txA-3k2k
	for ath11k@lists.infradead.org;
	Wed, 31 Dec 2025 10:55:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV78S532733277
	for <ath11k@lists.infradead.org>; Wed, 31 Dec 2025 10:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=; b=l9LalVlHnMCVESuA
	ktNoLFmYgR+yMVeRPmZ1JFaUS088FgaON98gaUXZiHac/q7y5EeYEAVhiSnb1ZAs
	bYT+nenGTAW/98+5957nIK3Pr9Yc487SIjLLFsPE3gnkNCbWbIo3ZBBxFrTCoTdK
	khuLOhMy8IAWzxCWzztVs4hz4Kcl5cvgc8fD+mE0Mfp4uZWixQ1IaVnRZ1KWAq41
	edQTCHKA1PUAvPJLc6h0JiA83UANl8JKbLs7O3Uf0ZpoojkDqxfTTdBzgaYir3SN
	77Kp5o6ebyhoMAclhFdxW9LbhvNNHHTcT7l7pkeRIVAhRR6276p8C4+OyjObaxgD
	SQHIsA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcy6agcnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 31 Dec 2025 10:55:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7c240728e2aso22644486b3a.3
        for <ath11k@lists.infradead.org>; Wed, 31 Dec 2025 02:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767178554; x=1767783354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
        b=Fn41dL5yPmJ8/pZJnJbGwM+Yo2hCBvIzqLR+Z3r8gnP1VO7BL2uDWy5sRwVdlrNYvH
         h4JaMVTd4f2nyhopKq1pOLpKGhIvF8FigJZaQklsz2tTcUyd0A2PmEWKEPzICrJZadTC
         /uVvht/0JO8aTk3WBP2q+51RsfltARH5IADzdKhaLrXmBESaSInXV/BhZfIZXUo9Jxpb
         68GGVYQ4sC0zr8yxJ4w1HAoXYUnwPF2wv1KX/W2cofwKDphxUdS/4pFSCyBl2J3XQWSx
         95GpK7PU9HsOQy3EBwLeOIf6pxt82bXQhPaRs36u7DB6F6GPRc7FVFnLpwwQFqP50TW3
         scYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178554; x=1767783354;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O+f7Mi5vx+QI3KHSGUaTpC6QdSIVzAVg+5x+XC0DFt4=;
        b=Uf/8SbNLYkjBZEmq6e3ifHdw+WdeLtJMXDrTOEsA3KJa0R/pUvs9kwnpXAp/x/jXK1
         ZWGvZCZKw8UvZwuZUW1wCzoMrx/J86S/KXBZSk6tNt4iFA/KnuqRXOGQVeVKjZr51Ed0
         0V7Ig+guNLBPNK2sDe3cREn3dnkGZYYY2TNC4gK4fiXn1j5YbAszZFUdK1LbTWjO/RlC
         BCfnmLOxnL5U9CQnGGE8zjrOYM4rXqtWoH1gfPegYdpbKvY8xqarAc+RGpu+W9fc6Pom
         Qi+NbPfZC0mccsH944iMrfU4mKV/cEmcUGkebJP0xxE63vzyVugDGvJWKcCh98kle07I
         F0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWUPd8Ol2sTT82R2okGb9eAmS/LQALDASAz++uQvxzPFqR2CRRQSp3IhqCVGhFWawR2ye1zKt4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8kT0ovwfqyL5HN3KEcE5WiRcspbHvj8pirzAk1aEBlzrwRCyX
	QNY4nODfnBqSlaqM4pLDI0q4j8oJarUvSsWb6+Mn4XK5qSS1DeRv1cWW7oQybPSykmnFqEX8hv+
	zQielhy4hdPW1VnYyAQNwuWoLfk8jQB5xbOH8nCpfiCdwt/PyJdCQzc6Kk/dyJEcR
X-Gm-Gg: AY/fxX502Ip8SgaVBxcDM1RINdiuQGkykiUjwV4HMmS89aZVIeQ2AiZ2FWMWgA9G7yt
	ur/OFe97xAj7aM9GkzbfasCDz7gFEr8bW6B9f1IdNuQ+ocouV6zUB5qsTCAkuM1QayCf7ep/+dr
	PKvVDhzX+yTLEQiIbOHTxXO6gn1Zk1kT1HtvvjL0PjoLZbfL41ei6tFBxto16VQSAM0YgZivpVS
	QTNkwm1cJZ10Saa+IJ3f/Ebfsd+k+OELfsnxySwDBjFLrnQQxeW84li4LT5RFTrhzVyThPq1+sS
	r+e5N1UwzdMMEyCIuiVzcH/eI+0o7FgIyl61IPR6L5LunodP4eTXgapmigC9GJU47XgdXdWEKvh
	ahbZV4G4263wZMpsBhva1ByoeHShPm5kT+vDtgA==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7ff64ec6724mr32190519b3a.31.1767178553537;
        Wed, 31 Dec 2025 02:55:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGioiLvW2U0joeR5pbtZjSEPSozpQwlq9uIpJCK2UPjGGzU6NNfRTPRLdM9fVlDl9M9HcekTA==
X-Received: by 2002:a05:6a00:348a:b0:7e1:730a:613b with SMTP id d2e1a72fcca58-7ff64ec6724mr32190489b3a.31.1767178553048;
        Wed, 31 Dec 2025 02:55:53 -0800 (PST)
Received: from [192.168.1.102] ([120.60.65.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm35616794b3a.45.2025.12.31.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:55:52 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Maxim Kochetkov <fido_max@inbox.ru>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        Johan Hovold <johan@kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        stable@vger.kernel.org
In-Reply-To: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
References: <20251218-qrtr-fix-v2-0-c7499bfcfbe0@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] net: qrtr: Drop the MHI 'auto_queue' feature
Message-Id: <176717854647.8976.2100798756796791971.b4-ty@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 16:25:46 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: MH_ivN7aP6qkf-QuObq4l6Yabghc5ShK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5NiBTYWx0ZWRfXwSG07YRoKux7
 2XyZCvOG/qD009cHYt/cTbnOqG/hkoz71rzQr48iNmHvYz9w/jnluXhg/ycukAyo9N4L5aPT0jA
 qwSAsYcJ0c3WwyFWPoLJHzB4DUYlW9o8elKmy1ThP9B1cq5jlGtT8twF1vh10hO5aTPWproNhx4
 yw00LWAwQ7g9z43sfJc+KERY0SuCAi1pUHctTLN3/ErwqnAMwTRU/dSWDp7rewzO3FrUeT7tZl2
 wIN/6SFUIXRfRJ0bAbt/IFrv6nWxz9/KIRLkNRrgiPlszSdYPkF/P8hzMSmvZeMLSGYNxY8dywp
 5zNm+qT3Povcb7+5IOIHCesqWc7PCHKi1I49yGfQPNcyLHaC59krsjc/jhIqXq75Or4P4zg6BU2
 ZfMSqelBdJZxVBOPCjwhfEbftEeMxH30ayKhdzTliDqzKwTQftkT7e0mD5D7sRm/ssCkOhFdHad
 Tl3Xq69/TAkcPuDxhdg==
X-Proofpoint-GUID: MH_ivN7aP6qkf-QuObq4l6Yabghc5ShK
X-Authority-Analysis: v=2.4 cv=J9GnLQnS c=1 sm=1 tr=0 ts=6955013a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=+SK5D59PVgoENw9OlSzWFQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=d1LwL24QG6zMnwvM45oA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_025556_374130_1ED8AE00 
X-CRM114-Status: GOOD (  14.79  )
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


On Thu, 18 Dec 2025 22:21:43 +0530, Manivannan Sadhasivam wrote:
> This series intends to fix the race between the MHI stack and the MHI client
> drivers due to the MHI 'auto_queue' feature. As it turns out often, the best
> way to fix an issue in a feature is to drop the feature itself and this series
> does exactly that.
> 
> There is no real benefit in having the 'auto_queue' feature in the MHI stack,
> other than saving a few lines of code in the client drivers. Since the QRTR is
> the only client driver which makes use of this feature, this series reworks the
> QRTR driver to manage the buffer on its own.
> 
> [...]

Applied, thanks!

[1/2] net: qrtr: Drop the MHI auto_queue feature for IPCR DL channels
      commit: 51731792a25cb312ca94cdccfa139eb46de1b2ef
[2/2] bus: mhi: host: Drop the auto_queue support
      commit: 4a9ba211d0264131dcfca0cbc10bff5ff277ff0a

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>


