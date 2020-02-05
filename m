Return-path: <ath11k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izPCR-00038W-Uc
 for ath11k@lists.infradead.org; Wed, 05 Feb 2020 18:14:57 +0000
Subject: Re: [PATCH 1/2] ath11k: add thermal cooling device support
References: <1580860830-12696-1-git-send-email-pradeepc@codeaurora.org>
From: John Crispin <john@phrozen.org>
Message-ID: <73391f93-a2c1-80b3-b77c-63c559f34326@phrozen.org>
Date: Wed, 5 Feb 2020 19:14:47 +0100
MIME-Version: 1.0
In-Reply-To: <1580860830-12696-1-git-send-email-pradeepc@codeaurora.org>
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
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>, ath11k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Hi Pradeep

1) do you plan to add the OF part so that we can run thermal_zones on 
top of this ?

2) what is the maximum number of levels that the HW supports ? looking 
at thermaltool it has to be at least 4 i guess ?
> +#define THERMAL_LEVELS  1

	John

_______________________________________________
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
