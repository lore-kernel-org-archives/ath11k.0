Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5y73-0005NJ-Sz
 for ath11k@lists.infradead.org; Thu, 05 Sep 2019 20:12:15 +0000
Received: from p5dcfb5d4.dip0.t-ipconnect.de ([93.207.181.212]
 helo=[10.255.231.27])
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <john@phrozen.org>) id 1i5y6z-0008FF-UD
 for ath11k@lists.infradead.org; Thu, 05 Sep 2019 22:12:10 +0200
Subject: Re: [PATCH 1/4] ath11k: add HE support
References: <20190904091211.26868-2-john@phrozen.org>
 <20190905143020.C3BFE60863@smtp.codeaurora.org>
From: John Crispin <john@phrozen.org>
Message-ID: <c4721a4d-4a44-926b-8403-92478708ee05@phrozen.org>
Date: Thu, 5 Sep 2019 22:12:09 +0200
MIME-Version: 1.0
In-Reply-To: <20190905143020.C3BFE60863@smtp.codeaurora.org>
Content-Language: en-US
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
Errors-To: ath11k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath11k@lists.infradead.org


On 05/09/2019 16:30, Kalle Valo wrote:
> John Crispin <john@phrozen.org> wrote:
>
>> Add basic HE support to the driver. The sband_iftype data is generated from
>> the capabilities read from the FW.
>>
>> Signed-off-by: Shashidhar Lakkavalli <slakkavalli@datto.com>
>> Signed-off-by: John Crispin <john@phrozen.org>
>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> 3 patches applied to ath11k-post-bringup branch of ath.git, thanks.
>
> 7c7ed585ad7b ath11k: add HE support
> e65a616f4e74 ath11k: add TWT support
> f73f939a61a1 ath11k: add spatial reuse support
>
*firework*

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
