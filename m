Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACC8E7717F
	for <ath11k@archiver.kernel.org>; Thu, 12 Dec 2024 17:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/Jv1vc2gsYsMdlLp4D9+fe7WyEROnGpSv61ypMLHJU=; b=3GZ8hM968BBnyYFfOlcDPHiHc5
	ePsV5BEFt6gpmFlfgljfELKnhVt+bVBvglLOsxJ6IqAQf+tF0U5KPW2j6cahFmH++b4npVeFbvGIR
	urbPU7I+v/dMQWNrmJ+YLROAgggzf1hnx48PKkNwvNnwrAY8TLE0iGd7MNHzbWlI1FPVmbjPQMxPu
	eQ3wArAVCdK3yfWUnCvVGqgFcIpWR/fqsSB47q32WuitLP4/mbkeM9zFAbvLszOcOxdbGG4HaL4bc
	G4V9bARyy2SMbUViipPFi0JCIOJeG5G7WgUcjq+7sx6XN2WsoDCV9TRm2oxLmPphNzU5KjfnY3jE6
	r8oQFF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnLG-00000001HMK-1tE0;
	Thu, 12 Dec 2024 17:51:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnLD-00000001HLi-3dCG
	for ath11k@lists.infradead.org;
	Thu, 12 Dec 2024 17:51:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCHJ53x027257
	for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 17:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/Jv1vc2gsYsMdlLp4D9+fe7WyEROnGpSv61ypMLHJU=; b=i+pX6Nr2rHHvGCjY
	YACfCl2LsNuc2GnZTGOCmHIozkPsA/Qf8SHgiUXO0guJVyt+Rwz+8f/Q7LJ+ORLP
	Bb9JQkhBkK6vRfGylByUwSniJCt6lqENh48Lt7OWKsCaQ7V/2Ztym5g+WhDSfsBT
	/P1+N2bhHal9kqRmhnXYmDBYssX3fIDGVnJOGHnCXmVZ2FNbukFduXOuvaxq06IR
	WC9saJQX1pgRnn8jQABiaUfy3K+9VC7iG3xY/2tYE/2mLAIQ7NMCDcaLfv9Q7w9p
	BkoaQQKP+fGx2FZg60d0frkoEfDk7FD2wVuUkjKGu8iWAys0ZOF+PBqvnaAKnm6z
	XAY5lg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8y2bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 17:51:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163a2a1ec2so13047785ad.1
        for <ath11k@lists.infradead.org>; Thu, 12 Dec 2024 09:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734025869; x=1734630669;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d/Jv1vc2gsYsMdlLp4D9+fe7WyEROnGpSv61ypMLHJU=;
        b=wXQ6zpVCvu2bQ8Bcn/Z42Ag5C69rmvHARshkSZNu54mvgNiKPDgE/sgE03DK6qWpei
         xlHzyWzV8k6eNOhUiYepbc7r9SMo4JtIazkiH/4WbWzHVc9xRu3BkrjiZWE5Byguilsf
         hf7zRJNt6neyqy++dCd1amMPzHO8mOoJuGDu7mOwx4xy/5ZFUVSYeNCidiIs3MrY1elj
         CY4hP77vEDRNNYbNvvXU9s20sag1EMht4Z6F5eefcRSCvJ7boiNb9K6+g/npPYxNOGnr
         I57NFkBGpHptWdZLYMMwokTMC8zw2HgHscUnLSKsnhpmVshhn/NcXqN7IcyT7RFmebAW
         VXaA==
X-Forwarded-Encrypted: i=1; AJvYcCVzTgjip5EHLw0tDrjLAVg97jlDgx+II0ciT7qFB3VujzZJ8knsPVXdOHGofc2zsLx425UzGUA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVJ1CJ/tyuK8uXiRTdLqkxHAVlU+EU/4pAjqAl1L40rg7m0q0e
	8WJHp3fQCzXAxBsVMt47QDObE0T/iXf70SI3KWZ8DkINeVyjVHcJ0lrf7VR4FmUY8MKR2KmamGD
	teSY2BDYZ8c9gB0aiawgp0q8f3hvYBbYRSSmqvUD3XA8x3S09yHznwGVQbLpR
X-Gm-Gg: ASbGncvOma7ybLznLZ+eSvBv/nTi6VagKfDb0dfvY+tRe1O/o7qXoQwmXx0lNaYWD0P
	4wEGplZYqZF1wKuM7pXoszJvKkFSn5NhXHmqLZ0mnmmjJVhFZ0JzwNKxRZhOpjkVv5UmUS7/KiJ
	JIzuIBF22y0sfcr0HgpO+CHOpt67WBLu7rOqEyG7oEU7VstcvchBBxIo1FkW4bZmUl5b6mAoHWO
	LoDoptvxvO3pxc9bsSZdR8eyZlWk3tq+Ag7XzccbcM0I6x5ZYx1N809YAf5qo0DHXBrssSocBvm
	QMA2Ex9kxWgVWnfYw5Le66LMMG/PksbMUUUNYuPsIQy2szRM3A==
X-Received: by 2002:a17:902:e882:b0:216:6c77:7bbb with SMTP id d9443c01a7336-2178ae6fb8fmr66257435ad.17.1734025869203;
        Thu, 12 Dec 2024 09:51:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsfTRZMlR3OeCYRFbEgDdM7Wjv4fWBG376wW6arwrK9P4ZUwOmufNbI8IvLWEqo6PfdZNr0w==
X-Received: by 2002:a17:902:e882:b0:216:6c77:7bbb with SMTP id d9443c01a7336-2178ae6fb8fmr66257235ad.17.1734025868877;
        Thu, 12 Dec 2024 09:51:08 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8e3f0b5sm125923045ad.20.2024.12.12.09.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 09:51:08 -0800 (PST)
Message-ID: <27cc63e7-1a63-4ba5-8c7a-12a78ad6d9fa@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 09:51:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 2/2] wifi: ath11k: Convert timeouts to
 secs_to_jiffies()
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
        Jeroen de Borst <jeroendb@google.com>,
        Praveen Kaligineedi <pkaligineedi@google.com>,
        Shailend Chand <shailend@google.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20241212-netdev-converge-secs-to-jiffies-v4-0-6dac97a6d6ab@linux.microsoft.com>
 <20241212-netdev-converge-secs-to-jiffies-v4-2-6dac97a6d6ab@linux.microsoft.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241212-netdev-converge-secs-to-jiffies-v4-2-6dac97a6d6ab@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IIhn92AKPxqojKxvZIi6YlP8PEtiKXuu
X-Proofpoint-GUID: IIhn92AKPxqojKxvZIi6YlP8PEtiKXuu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=848 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_095111_911817_9994F8F8 
X-CRM114-Status: UNSURE (   9.89  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

On 12/12/2024 9:33 AM, Easwar Hariharan wrote:
> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
> 
> secs_to_jiffies(). As the value here is a multiple of 1000, use
> 
> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
> 
> 
> 

something is wrong with your patch since it introduces a blank line after each
line.

Also if you want the ath11k patch to be taken separately, it goes through the
ath tree, not the net tree.

/jeff



